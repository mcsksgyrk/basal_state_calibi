using DataFrames
using CSV
using Plots
using Catalyst
using Latexify
using OrdinaryDiffEq
using .models

origi_params = Array(CSV.read("paramvals.txt",DataFrame, header=false))
new_params = Array(CSV.read("revised_params.txt",DataFrame, header=false))
origi_ics = ones(92)
tspan = (0,24)

ode_origi = ODEProblem(original_model, origi_ics, tspan, origi_params)
ode_revised = ODEProblem(revised_model, revised_ics, tspan, new_params)

sol_origi = solve(ode_origi)
sol_revised = solve(ode_revised)
