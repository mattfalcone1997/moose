[Mesh]
  file = ../../mesh/square_quad.e
[]

[Problem]
  type = FEProblem
  solve = false
  verbose_multiapps=true
[]

[Variables]
  [dummy]
    family = MONOMIAL
    order = CONSTANT
  []
[]

[Kernels]
  [dummy]
    type = NullKernel
    variable = dummy
  []
[]

[AuxVariables]
  [libmesh_scalar_var]
    family = MONOMIAL
    order = CONSTANT
  []
[]

[Functions]
  [parsed_function]
    type = ParsedFunction
    expression = 't*(x*x + y*y)'
  []
[]

[AuxKernels]
  [libmesh_scalar_var_ic]
    type = FunctionAux
    variable = 'libmesh_scalar_var'
    function = parsed_function
    execute_on = timestep_end
  []
[]

[Executioner]
  type = Transient
  dt = 1.
  end_time = 5.
[]

[Outputs]
  file_base = 'libmesh_parent_scalar_mfem_sub_quads'
  csv = true
  exodus=true
[]

[MultiApps]
  [libmesh_app]
    type = FullSolveMultiApp
    input_files = libmesh_sub_app.i
    execute_on = 'timestep_end'
  []
[]

[Transfers]
  [transfer_to_mfem]
    type = MultiAppGeneralFieldShapeEvaluationTransfer
    variable = temperature
    source_variable = libmesh_scalar_var
    to_multi_app = libmesh_app
  []
[]
