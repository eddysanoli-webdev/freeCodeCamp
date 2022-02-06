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
- Partials: SCSS files that start with an underscore (_). These will be ignored by the compiler and will not generate a CSS file. They are useful as a way to modularize your code. Each partial can contain a small reusable snippet of CSS.

### CSS

- :root: Selects the root element of the document. In HTML, root is equal to using the html tag (most of the time).
- Reset: A set of CSS rules that reset the styling of all HTML elements to a consistent baseline. Put at the top to make sure that at the beggining, all elements dont have a padding, margin or anything else. Basically used to remove the default settings added by HTML.
- *: Universal selector. Selects any and all types of elements in an element. Its similar to saying "all elements inside the current parent".
