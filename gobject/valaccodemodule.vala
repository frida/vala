/* valaccodemodule.vala
 *
 * Copyright (C) 2008  Jürg Billeter
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

using Gee;

/**
 * Code visitor generating C Code.
 */
public abstract class Vala.CCodeModule {
	public weak CCodeGenerator codegen { get; private set; }

	public CCodeModule head {
		get { return _head; }
		private set {
			_head = value;
			// propagate head property to all modules
			if (next != null) {
				next.head = value;
			}
		}
	}

	weak CCodeModule _head;
	CCodeModule? next;

	public CCodeModule (CCodeGenerator codegen, CCodeModule? next) {
		this.codegen = codegen;
		this.next = next;
		this.head = this;
	}

	public virtual void emit (CodeContext context) {
		next.emit (context);
	}

	public virtual void visit_source_file (SourceFile source_file) {
		next.visit_source_file (source_file);
	}

	public virtual void visit_class (Class cl) {
		next.visit_class (cl);
	}

	public virtual void visit_interface (Interface iface) {
		next.visit_interface (iface);
	}

	public virtual void visit_struct (Struct st) {
		next.visit_struct (st);
	}

	public virtual void visit_method (Method m) {
		next.visit_method (m);
	}

	public virtual void visit_signal (Signal sig) {
		next.visit_signal (sig);
	}

	public virtual void visit_creation_method (CreationMethod m) {
		next.visit_creation_method (m);
	}

	public virtual void visit_member_access (MemberAccess expr) {
		next.visit_member_access (expr);
	}

	public virtual void visit_element_access (ElementAccess expr) {
		next.visit_element_access (expr);
	}

	public virtual void visit_assignment (Assignment assignment) {
		next.visit_assignment (assignment);
	}

	public virtual void visit_invocation_expression (InvocationExpression expr) {
		next.visit_invocation_expression (expr);
	}

	public virtual void visit_array_creation_expression (ArrayCreationExpression expr) {
		next.visit_array_creation_expression (expr);
	}

	public virtual void generate_cparameters (Method m, DataType creturn_type, bool in_gtypeinstance_creation_method, Map<int,CCodeFormalParameter> cparam_map, CCodeFunction func, CCodeFunctionDeclarator? vdeclarator = null, Map<int,CCodeExpression>? carg_map = null, CCodeFunctionCall? vcall = null, int direction = 3) {
		next.generate_cparameters (m, creturn_type, in_gtypeinstance_creation_method, cparam_map, func, vdeclarator, carg_map, vcall, direction);
	}

	public virtual string? get_custom_creturn_type (Method m) {
		return next.get_custom_creturn_type (m);
	}

	public virtual void generate_dynamic_method_wrapper (DynamicMethod method) {
		next.generate_dynamic_method_wrapper (method);
	}

	public virtual bool method_has_wrapper (Method method) {
		return next.method_has_wrapper (method);
	}

	public virtual CCodeIdentifier get_value_setter_function (DataType type_reference) {
		return next.get_value_setter_function (type_reference);
	}

	public virtual CCodeExpression get_construct_property_assignment (CCodeConstant canonical_cconstant, DataType property_type, CCodeExpression value) {
		return next.get_construct_property_assignment (canonical_cconstant, property_type, value);
	}

	public virtual CCodeFunctionCall get_param_spec (Property prop) {
		return next.get_param_spec (prop);
	}

	public virtual CCodeFunctionCall get_signal_creation (Signal sig, TypeSymbol type) {
		return next.get_signal_creation (sig, type);
	}

	public virtual CCodeFragment register_dbus_info (ObjectTypeSymbol bindable) {
		return next.register_dbus_info (bindable);
	}

	public virtual string get_dynamic_property_getter_cname (DynamicProperty node) {
		return next.get_dynamic_property_getter_cname (node);
	}

	public virtual string get_dynamic_property_setter_cname (DynamicProperty node) {
		return next.get_dynamic_property_setter_cname (node);
	}

	public virtual string get_dynamic_signal_cname (DynamicSignal node) {
		return next.get_dynamic_signal_cname (node);
	}

	public virtual string get_dynamic_signal_connect_wrapper_name (DynamicSignal node) {
		return next.get_dynamic_signal_connect_wrapper_name (node);
	}

	public virtual string get_dynamic_signal_disconnect_wrapper_name (DynamicSignal node) {
		return next.get_dynamic_signal_disconnect_wrapper_name (node);
	}

	public virtual void generate_marshaller (Gee.List<FormalParameter> params, DataType return_type, bool dbus = false) {
		next.generate_marshaller (params, return_type, dbus);
	}
	
	public virtual string get_marshaller_function (Gee.List<FormalParameter> params, DataType return_type, string? prefix = null, bool dbus = false) {
		return next.get_marshaller_function (params, return_type, prefix, dbus);
	}

	public virtual string get_array_length_cname (string array_cname, int dim) {
		return next.get_array_length_cname (array_cname, dim);
	}

	public virtual CCodeExpression get_array_length_cexpression (Expression array_expr, int dim = -1) {
		return next.get_array_length_cexpression (array_expr, dim);
	}
}
