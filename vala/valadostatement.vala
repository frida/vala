/* valadostatement.vala
 *
 * Copyright (C) 2006-2009  Jürg Billeter
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.

 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.

 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
 *
 * Author:
 * 	Jürg Billeter <j@bitron.ch>
 */

using GLib;

/**
 * Represents a do iteration statement in the source code.
 */
public class Vala.DoStatement : Loop, Statement {
	/**
	 * Creates a new do statement.
	 *
	 * @param condition         loop condition
	 * @param body              loop body
	 * @param source_reference  reference to source code
	 * @return                  newly created do statement
	 */
	public DoStatement (Expression condition, Block body, SourceReference? source_reference = null) {
		base (condition, body, source_reference);
	}

	public override void accept (CodeVisitor visitor) {
		visitor.visit_do_statement (this);
	}

	public override void accept_children (CodeVisitor visitor) {
		body.accept (visitor);

		condition.accept (visitor);

		visitor.visit_end_full_expression (condition);
	}

	public override bool check (CodeContext context) {
		if (checked) {
			return !error;
		}

		checked = true;

		// convert to simple loop

		// do not generate variable and if block if condition is always true
		if (condition.is_always_true ()) {
			var loop = new LoopStatement (body, source_reference);

			unowned Block parent_block = (Block) parent_node;
			parent_block.replace_statement (this, loop);

			if (!loop.check (context)) {
				error = true;
			}

			return !error;
		}

		var block = new Block (source_reference);

		var first_local = new LocalVariable (context.analyzer.bool_type.copy (), get_temp_name (), new BooleanLiteral (true, source_reference), source_reference);
		block.add_statement (new DeclarationStatement (first_local, source_reference));

		var if_condition = new UnaryExpression (UnaryOperator.LOGICAL_NEGATION, condition, condition.source_reference);
		var true_block = new Block (condition.source_reference);
		true_block.add_statement (new BreakStatement (condition.source_reference));
		var if_stmt = new IfStatement (if_condition, true_block, null, condition.source_reference);

		var condition_block = new Block (condition.source_reference);
		condition_block.add_statement (if_stmt);

		var first_if = new IfStatement (new UnaryExpression (UnaryOperator.LOGICAL_NEGATION, new MemberAccess.simple (first_local.name, source_reference), source_reference), condition_block, null, source_reference);
		body.insert_statement (0, first_if);
		body.insert_statement (1, new ExpressionStatement (new Assignment (new MemberAccess.simple (first_local.name, source_reference), new BooleanLiteral (false, source_reference), AssignmentOperator.SIMPLE, source_reference), source_reference));

		block.add_statement (new LoopStatement (body, source_reference));

		unowned Block parent_block = (Block) parent_node;
		parent_block.replace_statement (this, block);

		if (!block.check (context)) {
			error = true;
		}

		return !error;
	}
}
