[![Deploys by netlify](https://www.netlify.com/img/global/badges/netlify-color-bg.svg)](https://www.netlify.com)

# Home Assistant Brands

This repository holds the icons and logos for all the brands Home Assistant
supports.

This repository is used to generate a static website, serving these images
for use in our Home Assistant projects. The goal is to have a centralized
repository of brand images.

## Inner workings

The `./src` folder contains a folder for each `domain` Home Assistant provides
an integration for. A domain can contain two files:

- `icon.png`: A square avatar-like icon, representing the brand or product for that domain.
- `logo.png`: The logo of the brand or product for that domain.

Those images are served in the following format:

- `https://brand.home-assistant.io/[domain]/icon.png`
- `https://brand.home-assistant.io/[domain]/logo.png`

### Missing image handling

- If a domain is missing, the images from the `_placeholder` domain is served instead.
- If a domain has only an `icon.png` file, that same icon will be served when `logo.png` is requested.
- If a domain is missing the `icon.png` file, the placeholder icon will be served instead.

### Caching

All icons are cached on the client-side browser end for 900 seconds, and cached
by Cloudflare for 604800 seconds.

Placeholder images are excepted from this. Placeholder images have a 900 seconds
cache on the client0-side and are cached for 1 hour on Cloudflare. This allows
us to replace placeholder images within an acceptable timeframe without losing
our cache.

## Image specification

All images must have the following requirements:

- The filetype of all images must be PNG.
- They should be properly compressed and optimized (lossless is preferred) for use on the web.
- Interlaced is preferred.
- Images with transparency is preferred.

### Icon image requirements

Additional to the general image requirements listed above, for the icon image,
the following requirements are applied as well:

- Aspect ratio needs to be 1:1 (square).
- Minimal icon size is 128x128 pixels.
- Maximum icon size is 256x256 pixels.
- The maximum icon pixel size is, of course, preferred.

### Logo image requirements

Additional to the general image requirements listed, for the logo image,
the following requirements are applied as well:

- A landscape image is preferred.
- Aspect ratio should respect the logo of the brand.
- Shortest side of te image must be at least 128 pixels.
- Longest side of the image must not exceed 512 pixels.
- The maximum pixel size for the longest side of the images is, of course, preferred.

## Using the same logo & icon for different brands

In order to keep the size of this repository as efficient as possible,
symlinking domain folders for the same icon/logos is allowed. The deployment
process at our hosting provider will unpack these symlinks to actual files
during the deployment process.

## Trademark Legal Notices

All product names, trademarks and registered trademarks in the images in this
repository, are property of their respective owners. All images in this
repository are used by the Home Assistant project for identification purposes
only.

The use of these names, trademarks and brand appearing in these image files,
do not imply endorsement.
