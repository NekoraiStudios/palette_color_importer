# 🎨 Godot – Convert Image to Color Palette

**Un plugin Godot Editor pour générer automatiquement une palette de couleurs depuis n’importe quelle image.**

## 📌 Description

Ce plugin ajoute une option au menu contextuel de l’éditeur Godot permettant de **convertir une image en ressource `ColorPalette` (.tres)**.

Lorsque vous faites clic droit sur une image dans le FileSystem (PNG, JPG, WEBP, etc.), vous pouvez sélectionner :

> **Convert to palette**

Le plugin extrait alors toutes les couleurs uniques de l’image (en ignorant les pixels presque transparents) et génère automatiquement un fichier `palette.tres` dans le même dossier.

## 🧩 Fonctionnalités

* S’intègre directement au **menu contextuel** du FileSystem.
* Détection automatique des formats d’image supportés (png, jpg, webp, svg, tga, bmp, hdr, etc.).
* Extraction **de toutes les couleurs uniques** avec alpha > 0.1.
* Génération d’une ressource Godot `ColorPalette` prête à l’emploi.
* Simple, léger et pratique pour les workflows artistiques (pixel-art, UI, shaders, palettes dynamiques…).

---

## 📥 Installation

1. Copier le dossier du plugin dans :

   ```
   res://addons/convert_to_palette/
   ```
2. Dans l’éditeur Godot :
   **Project → Project Settings… → Plugins**
3. Activer :
   **Convert to Palette**

---

## 🕹️ Utilisation

1. Dans le panneau **FileSystem**, sélectionnez une image.
2. Faites **clic droit**.
3. Choisissez :
   **Convert to palette**
4. Un fichier `palette.tres` apparaîtra dans le *même dossier que l’image*.

---

## 🛠️ Code source (explication)

Le plugin :

* Vérifie qu’un seul fichier est sélectionné.
* Vérifie que l’extension est celle d’une image.
* Charge l’image via `ResourceLoader`.
* Parcourt chaque pixel, stocke les couleurs uniques dans un `PackedColorArray`.
* Crée une ressource `ColorPalette` contenant ces couleurs.
* Sauvegarde la palette avec `ResourceSaver.save()`.

---

## 📄 Exemple de structure générée

```
my_image.png
palette.tres
```

La ressource `.tres` contient toutes les couleurs détectées, utilisables dans vos scripts, shaders ou outils Godot.

---

## 📚 Compatibilité

* Godot 4.x
* Tous projets utilisant `ColorPalette` (ou ressources personnalisées compatibles)

---

## 📝 Licence

MIT License

Copyright (c) 2025 NekoraiStudios