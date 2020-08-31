'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "5da774def6e62760619d0def4709ff07",
"assets/assets/google_fonts/Rubik-Black.ttf": "e33e3eb120a7d7460efd1ab3a3a2d989",
"assets/assets/google_fonts/Rubik-BlackItalic.ttf": "0449e70c2cf0aead03590b30aacd5a14",
"assets/assets/google_fonts/Rubik-Bold.ttf": "9d63f819011db1fda0a67fcc3c206940",
"assets/assets/google_fonts/Rubik-BoldItalic.ttf": "630c954d5ed1169bcce60022b78cd693",
"assets/assets/google_fonts/Rubik-ExtraBold.ttf": "51cda909deeb43b40d0d6fd92aeaf6d0",
"assets/assets/google_fonts/Rubik-ExtraBoldItalic.ttf": "6d199beb40ad857f2a81d2954d7e51dc",
"assets/assets/google_fonts/Rubik-Italic.ttf": "36cc58c962ffcda418efc1d6b4bf1d21",
"assets/assets/google_fonts/Rubik-Light.ttf": "36b56224cefc587dcdeea981187e5e2b",
"assets/assets/google_fonts/Rubik-LightItalic.ttf": "626e8ad5fc0b170dc0491d50d693b8b3",
"assets/assets/google_fonts/Rubik-Medium.ttf": "f3e8e533dc4ba5c337c8abd1a8935e2b",
"assets/assets/google_fonts/Rubik-MediumItalic.ttf": "970dfc98b4c7271004491147a837437a",
"assets/assets/google_fonts/Rubik-Regular.ttf": "09556186b81cbb10fd5c43745a7f32a7",
"assets/assets/google_fonts/Rubik-SemiBold.ttf": "f75d30150431abaafd1dc9fdc0c3f1a9",
"assets/assets/google_fonts/Rubik-SemiBoldItalic.ttf": "4c0383404e33fed22c4270bea26b462a",
"assets/assets/logos/codeforfun-logo.png": "88e2e486ae47e158fa1fa49be07f16ab",
"assets/assets/logos/kipp-logo.png": "198a3e62ba118c9c5e1778124041cc65",
"assets/assets/logos/schoolzilla-logo.png": "bf5e546bfd9121130b37097d8d57439d",
"assets/assets/misc/profile_picture.png": "cebf9f88c2d3e24778492cc5c23a55ae",
"assets/assets/misc/resume.jpg": "1bcf38a51ee423f4ec86e5ff93d1f756",
"assets/assets/project_previews/dark/dark_flutter_safety.png": "260c072622ddc17d80cfab5002a6f5b6",
"assets/assets/project_previews/dark/dark_flutter_twitter.png": "2d45c04cbc329ceaace2513b05e3085b",
"assets/assets/project_previews/dark/dark_flutter_units.png": "06d6fce60b2b0b5e5d34ebd0b2281074",
"assets/assets/project_previews/dark/dark_simple_todo.png": "28b6b88e15dad4a8ffc35cc428d3a02f",
"assets/assets/project_previews/light/light_flutter_safety.png": "d2a0825eb1db695b8e3b2be32088ab8d",
"assets/assets/project_previews/light/light_flutter_twitter.png": "27129e96c4a1dafe00cffc451a35a7aa",
"assets/assets/project_previews/light/light_flutter_units.png": "ee68068a1d4a2292d532a41fcd2675c9",
"assets/assets/project_previews/light/light_simple_todo.png": "fe48d744f9466efdeeafb7e0c196cd4c",
"assets/FontManifest.json": "1b1e7812d9eb9f666db8444d7dde1b20",
"assets/fonts/MaterialIcons-Regular.otf": "a68d2a28c526b3b070aefca4bac93d25",
"assets/NOTICES": "c25cb889122f6a988a8c4206389d17df",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/packages/material_design_icons_flutter/lib/fonts/materialdesignicons-webfont.ttf": "b0fd91bb29dcb296a9a37f8bda0a2d85",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "4f02f09280219626ff3817c139400ac9",
"/": "4f02f09280219626ff3817c139400ac9",
"main.dart.js": "daa8ea614c27cf8ef25b590a86247dc7",
"manifest.json": "64d601e18a105cd91f5414c830fa0389"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value + '?revision=' + RESOURCES[value], {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');

      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }

      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#')) {
    key = '/';
  }
  // If the URL is not the RESOURCE list, skip the cache.
  if (!RESOURCES[key]) {
    return event.respondWith(fetch(event.request));
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache. Ensure the resources are not cached
        // by the browser for longer than the service worker expects.
        var modifiedRequest = new Request(event.request, {'cache': 'reload'});
        return response || fetch(modifiedRequest).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    return self.skipWaiting();
  }

  if (event.message === 'downloadOffline') {
    downloadOffline();
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey in Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
