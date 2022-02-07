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
- Mixins: Allows to insert repeatable snippets of CSS. Its also able to use arguments in a similar way to functions.
- Operations: With SASS, operations dont need to be put inside a "calc" statement. Just add the operation itself. However, types cannot be mixed, so "40% - 300px" is not valid.

### CSS

- :root: Selects the root element of the document. In HTML, root is equal to using the html tag (most of the time).
- Reset: A set of CSS rules that reset the styling of all HTML elements to a consistent baseline. Put at the top to make sure that at the beggining, all elements dont have a padding, margin or anything else. Basically used to remove the default settings added by HTML.
- *: Universal selector. Selects any and all types of elements in an element. Its similar to saying "all elements inside the current parent".
- lighten: Lightens a color by a certain percentage.
- calc(): Multiply, add, subtract or divide two measurements in CSS. For example: 100% - 400px.
- text-decoration: No underline, overline or others decorating the text.
- ::before: Allows the user to add elements directly before or after a specific element.
- column-rule: Create a line separator between columns.
