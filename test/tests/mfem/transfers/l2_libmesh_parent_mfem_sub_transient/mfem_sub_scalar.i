[Mesh]
  type = MFEMMesh
  file = ../../mesh/square_quad.e
[]

[Problem]
  type = MFEMProblem
  solve = false
  verbose_multiapps=true
[]

[FESpaces]
  [L2FESpace]
    type = MFEMScalarFESpace
    fec_type = L2
    fec_order = CONSTANT
  []
[]

[Variables]
  [temperature]
    type = MFEMVariable
    fespace = L2FESpace
  []
[]

[Executioner]
  type = MFEMTransient
  device = cpu
  dt = 1.
  end_time = 5.
[]

[Outputs]
  [ParaViewDataCollection]
    type = MFEMParaViewDataCollection
    file_base = transfer_tests
  []
[]
