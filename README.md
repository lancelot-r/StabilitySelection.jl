# StabilitySelection.jl

[![Build Status](https://github.com/lancelot-r/StabilitySelection.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/lancelot-r/StabilitySelection.jl/actions/workflows/CI.yml?query=branch%3Amain)

'StabilitySelection.jl' est un package julia dont l'objectif est d'implémenter la procédure de stability selection basée sur la régression Lasso/Ridge/ElasticNet en utilisant 'GLMNet.jl'. Le package suit la méthodologie de Meinsahausen & Bühlmann (2010).

---

## Caracteristiques
- Sampling sans remise
- Permet de sortir les variables selectionneés de manière stable
- Visualisation des résultats à l'aide de Makie
- Selection à lambda_min, lambda_1se ou lambda spécifié par l'utilisateur

---

## Utilisation basique 

using StabilitySelection

results = stability_selection(X, y; B = 100, subsample_fraction = 0.5)

La fonction retourne les éléments suivants : 

struct StabilityResult
    frequencies ::Vector(Float64)
    threshold :: Float64
    selected :: Vector{Int}
    metadata :: Dict{Symbol, Any}

---

## Temps d'exécution R

Les temps d'exécution R affichés lors de l'execution du fichier "test/runtests.jl" ont été obtenus en utilisant un algorithme de stabsel simmilaire à celui du package et les donnes "epiclock.csv", avec les configurations suivantes : 16GB RAM / CPU M1 PRO / GPU APPLE M1 PRO

---

# Graphiques

Deux types de graphiques sont fournis avec le package :

- plot_frequencies(results) : plot des fréquences de selection de toutes les variables
- plot_selected(results) : plot des variables selectionnées