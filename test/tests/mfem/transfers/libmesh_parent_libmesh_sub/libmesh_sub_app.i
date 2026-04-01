[Mesh]
  file = ../../mesh/square_quad.e
[]

[Problem]
  type = FEProblem
  solve = false
  verbose_multiapps=true
[]

[Variables]
  [temperature]
    family = MONOMIAL
    order = CONSTANT
  []
[]

[Executioner]
  type = Steady
[]

[Outputs]
  exodus=true
[]
