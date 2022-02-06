# [Sass for Begginers.](https://www.youtube.com/watch?v=_a5j7KoflTs&t=847s&ab_channel=freeCodeCamp.org)

Code created while following the Youtube on freeCodeCamp for Sass. The notes taken during the course are included for future reference.

## Notes

### Syntax

Sass supports two types of syntax

- SCSS: Superset of CSS. All valid CSS is valid inside SCSS. Most popular.
- Indented: Original syntax for Sass. It uses indentation instead of curly braces ({}) and semi-colons (;)

## Live Sass Compiler Extension Setup

Install the extension and then add the following section inside the configuration. This will configure the extension for saving the compiled ".css" file inside the distribution directory.

```json
"liveSassCompile.settings.formats": [
    {
        "format": "expanded",
        "extensionName": ".css",
        "savePath": "/dist/css"
    }
]
```

### Emmet

- .name: Creates a div with the class of "name"

### Sass

- Maps: Arrays of key value pairs
- Interpolation: When using "&" as a synomym for the parent class, we can surround it by "#{}" to interpolate and make it include not only the name of the parent, but all of the parent classes.

### CSS

- :root: Selects the root element of the document. In HTML, root is equal to using the html tag (most of the time).