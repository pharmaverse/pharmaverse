---
title: "Customization"
date: 2018-12-29T11:02:05+06:00
weight: 4
draft: false
---

**GoDocs** has been built to be as configurable as possible.


### Change the logo

In `config.toml` you will find a logo variable. you can change your logo there.

```toml
logo = "images/logo.png"
```

{{< notice "tip" >}}
The size of the logo will adapt automatically
{{< /notice >}}

### Change the favicon

If your favicon is a png, just drop off your image in your local `static/images/` folder and name it `favicon.png`

If you need to change this default behavior, create a new file in `layouts/partials/` named `head.html`. Then write something like this:

```html
<link rel="shortcut icon" href="/images/favicon.png" type="image/x-icon" />
```

### Change default colors

**GoDocs** support change color. You can change the colors from `assets/scss/variables.scss`. You can change the colors of the template as you want.


```scss
/* Color Variables */
$primary-color: #FF0043;
$text-color: #333;
$text-color-dark: #222;
$text-color-light: #999;
$body-color: #fff;
$border-color: #E2E2E2;
$black: #000;
$white: #fff;
$light: #FBFBFB;

/* Font Variables */
$font-primary: 'Montserrat', sans-serif;
$icon-font: 'themify';
```