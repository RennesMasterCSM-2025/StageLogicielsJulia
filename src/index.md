# Installation de Julia

Pour commencer, nous avez besoin d'installer Julia.
[juliaup](https://github.com/JuliaLang/juliaup) est une solution
légère permettant d'installer la dernière version disponible.

```bash
curl -fsSL https://install.julialang.org | sh
. /home/pnavaro/.profile
```

```
$ julia
               _
   _       _ _(_)_     |  Documentation: https://docs.julialang.org
  (_)     | (_) (_)    |
   _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 1.11.6 (2025-07-09)
 _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
|__/                   |
```

---

# REPL (Read-Eval-Print Loop) 

Le REPL Julia REPL possède 4 modes: Julia, package (`]`), help (`?`) et shell (`;`).

Vous pouvez consulter la [documentation](https://docs.julialang.org/en/v1/stdlib/REPL/) pour les details.

```>repl-example
a, b = 1, 2;
a + b
```

Il s'agit du mode standard (Julia) du REPL, mais il existe trois autres modes que vous devez connaître.
Pour accéder à chaque mode, tapez un caractère spécifique après l'invite « julia> ».
Une fois que vous êtes dans un mode non Julia, vous y restez pour chaque commande que vous exécutez.
Pour en sortir, appuyez sur la touche "backspace" après l'invite et vous retrouverez l'invite « julia> ».

---

# Help mode (`?`)

En appuyant sur « ? », vous pouvez obtenir des informations et des métadonnées sur les objets Julia (fonctions, types, etc.) ou les symboles Unicode.
La requête récupère la chaîne de documentation de l'objet, qui explique comment l'utiliser.

```?help-example
search: println print pointer sprint printstyled

  println([io::IO], xs...)

  Print (using print) xs to io followed by a newline. If io is not supplied, prints to the default output stream stdout.

  See also printstyled to add colors etc.

  Examples
  ≡≡≡≡≡≡≡≡

  julia> println("Hello, world")
  Hello, world

  julia> io = IOBuffer();

  julia> println(io, "Hello", ',', " world.")

  julia> String(take!(io))
  "Hello, world.\n"
```

---

# Package mode (`]`)

En appuyant sur `]` vous accédez à [Pkg.jl](https://github.com/JuliaLang/Pkg.jl), le gestionnaire de package, il faut absolument parcourir la [documentation](https://pkgdocs.julialang.org/v1/getting-started/).

* `]activate` création d'environnements differents local, partagé ou temporaires;
* `]instantiate` installe les packages de cet environnement listés dans le fichier Project.toml;
* `]add`, `]update` (ou `]up`) et `]remove` (ou `]rm`) packages;
* obtenir le `]status` (or `]st`) de l'environnement activé.

Illustration avec le package Example.jl:

```]pkg-example
add Example
```

```]pkg-example
status
```

---

# Shell mode (`;`)

En appuyant sur `;` vous basculez sur un terminal. Exemple avec un système Linux :

```;shell-example
ls 
```


---

# VSCode 

Les programmes julia sont souvent de simples fichiers texte avec une extension spécifique `.jl`.
N'importe quel éditeur de texte suffit pour écrire et modifier du code Julia mais, en pratique, VSCode rend l'expérience plus agréable, grâce à des utilitaires liés au code et des extensions spécifiques au langage.

Le meilleur IDE pour Julia est [Visual Studio Code](https://code.visualstudio.com/), ou VSCode, développé par Microsoft.
En effet, l'[extension Julia pour VSCode](https://www.julia-vscode.org/) est la plus riche en fonctionnalités parmi tous les plugins IDE pour Julia.
Vous pouvez la télécharger depuis le Marketplace de VSCode et lire sa [documentation](https://www.julia-vscode.org/docs/stable/).

Des [raccourcis clavier](https://www.julia-vscode.org/docs/stable/userguide/keybindings/) sont fournis par cette extension.  `Ctrl + Shift + P` (ou `Cmd + Shift + P` sur Mac) ouvre la palette de commandes de VSCode, dans laquelle vous pouvez tapez "julia" pour voir ce que vous pouvez faire.


---

# Exécuter du code

Ouvrez un REPL et exécutez tout votre code de manière interactive.

Vous pouvez exécuter un script Julia depuis votre terminal.

```bash
julia monfichier.jl  # à éviter
```

Julia a une latence de démarrage et de compilation plutôt élevée. C'est pourquoi il faut lancer un REPL et y exécuter tout votre code avec la fonction include.

```julia-repl
julia> include("monfichier.jl")
```

Alternativement, `includet` du package [Revise.jl](https://github.com/timholy/Revise.jl) peut être utilisé pour "inclure et suivre" un fichier.
Cela mettra automatiquement à jour les modifications apportées aux définitions de fonctions dans le fichier dans la session REPL en cours.

Lorsque vous gardez le même REPL ouvert pendant longtemps, il est courant de se retrouver avec un espace de travail où les définitions de certaines variables ou fonctions ont été écrasées de manière inattendue. Cela peut vous obliger à redémarrer votre REPL de temps en temps, et c'est normal.

---

# Installer IJulia et Jupyter

Vous pouvez installer Jupyter avec le package IJulia

```julia
julia> import Pkg
julia> Pkg.add("IJulia")
    Updating registry at `~/.julia/registries/General.toml`
   Resolving package versions...
  No Changes to `~/.julia/environments/v1.11/Project.toml`
  No Changes to `~/.julia/environments/v1.11/Manifest.toml`

julia> using IJulia

julia> notebook( dir = pwd())
```

---

# Jupyter Notebook

- Le calepin Jupyter est un outil de rédaction qui permet de partager une analyse mathématique. 
- Rassembler du code informatique, du texte, des images et des formules mathématiques dans un seul document. 
- Le code informatique est modifiable et exécutable. 
- Excellent support pour travailler et surtout pour partager.
- Jupyter comporte de nombreuses extensions et supporte [un nombre important de langages](https://github.com/jupyter/jupyter/wiki/Jupyter-kernels). 
- Logiciel libre, ouvert et totalement gratuit qui fonctionne sur tous les systèmes d'exploitation existants.

Jupyter est un acronyme des 3 langages supportés à l'origine du projet: **JU**lia, **PYT**hon, et **R**

---

# Raccoucis clavier

- Pour afficher les commandes disponibles: `Cmd + Shift + P`
- Exécuter une cellule
    - 'Cmd-Enter' exécute la cellule courante 
    - 'Shift-Enter' exécute la cellule courante et passe à la suivante
    - 'Alt-Enter' exécute la cellule et crée une nouvelle en dessous.
    
- `Esc` permet de basculer en mode "commande" et vous pouvez naviguer dans le document avec les flèches de votre clavier. En mode "commande":
   - `A` permet d'insérer une nouvelle cellule **au dessus** de la cellule active
   - `B` permet d'insérer une nouvelle cellule **en dessous** de la cellule active
   - `M` bacule en mode texte (markdown), `Y` pour revenir au code
   - `D + D` en pressant deux fois ce caractère vous effacez la cellule courante
- "Shift-Ctrl-M" permet de couper une cellule en deux au niveau du curseur.

---

# Remarques importantes

- Un calepin Jupyter n'est pas vraiment un programme Julia
- Il s'agit d'une suite d'instructions exécutées dans un ordre particulier avec éventuellement des répétitions.
- Avant de partager un notebook, il est préférable d'aller dans l'onglet `Kernel` et cliquer sur `Restart & Run All` et vérifier que tout ce passe bien.

---

## Environnement local

Comme nous l'avons vu, Pkg.jl est l'équivalent Julia de `pip` ou `conda` pour Python.
Il vous permet d'[installer des paquets](https://pkgdocs.julialang.org/v1/managing-packages/) et de [gérer des environnements](https://pkgdocs.julialang.org/v1/environments/) (ensembles de paquets avec des versions spécifiques).

Vous pouvez activer un environnement depuis le REPL Pkg en spécifiant son chemin `]activate quelquechemin`.
Typiquement, vous feriez `]activate .` pour activer l'environnement dans le répertoire courant.
Une autre option est de démarrer Julia directement dans un environnement, avec l'option en ligne de commande `julia --project=quelquechemin`.

Une fois dans un environnement, les paquets que vous `]add` seront listés dans deux fichiers `quelquechemin/Project.toml` et `quelquechemin/Manifest.toml` :

* `Project.toml` contient les informations générales du projet (nom du paquet, identifiant unique, auteurs) et les dépendances directes avec des contraintes de version.
* `Manifest.toml` contient les versions exactes de toutes les dépendances directes et indirectes.

---

## Environnement global

Si vous n'êtes entré dans aucun projet local, les paquets seront installés dans l'environnement par défaut, appelé `@v1.X` d'après la version active de Julia (notez le `@` devant le nom).
Les paquets installés de cette manière sont disponibles quel que soit l'environnement local activé, grâce à l'["empilement d'environnements"](https://docs.julialang.org/en/v1/manual/code-loading/#Environment-stacks) (*stacking*).
Il est recommandé de garder l'environnement par défaut très léger pour éviter les conflits de dépendances. Il ne devrait contenir que des outils de développement essentiels.

Exercice: 

- Installez ls packages `Revise`, et `Plots` dans l'environnement global.
- Créez un répertoire avec un environnement local
- Ajouter les packages `FFTW` 
