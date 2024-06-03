# 1pager-printable-html

A simple HTML + CSS template for creating a one-page document primarily for printing (to paper or PDF).  Useful for creating layout-sensitive documents such as resumes, without resorting to LaTeX or publishing software like Adobe InDesign.

## View

Viewing the file in a browser is akin to viewing a PDF document in the "Fit width" mode, up to a maximum width of 50em.  Much care has been taken to ensure that the text size and layout between fixed and fluid layouts remains exactly the same.  That said, the fluid layout may cause some slight formatting oscillations while being resized.  Since the print CSS also stretches the document to the size of the paper, double-check formatting when printing.

## Edit

Simply place your content inside the `<main></main>` tag, and customize CSS appropriately.  Using relative units are recommended (e.g. `em`) to ensure that the fluid layout functions properly---even for size and positioning of images and other elements.  The width of the document is 50em.

## Print

A script `html_to_pdf.sh` is provided which runs headless Chrome in a Docker image (around 420 MB) and prints the provided HTML to PDF.  It takes takes two arguments: HTML input file, and PDF output file.  If you end up with a multi-file webpage (e.g. with images, separate CSS files, or other resources), this script is not suitable, but could be easily modified to accept a directory or a set of input files.

## Compatibility

This template has been tested in modern versions of Firefox and Chrome (mid 2024).  Appearance is almost identical.

## Caveats

As mentioned above, layout formatting can sometimes oscillate when resizing, and may change slightly when printed and stretched to fit a PDF.  Consider using `transform: scale()` in the `@media print` section to sidestep this problem, or perhaps come up with a JavaScript augmented solution which guarantees identical layout even across browser window resizing.
