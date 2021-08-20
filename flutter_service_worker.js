'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/assets/fonts/proxima_nova/ProximaNova-Bold.otf": "62d4d7d369292a9bf23762465ec6d704",
"assets/assets/fonts/proxima_nova/ProximaNova-Regular.otf": "410504d49238e955ba7dc23a7f963021",
"assets/assets/fonts/proxima_nova/ProximaNova-Thin.otf": "8f0bc01ce5e5becef482d277cb72b728",
"assets/assets/fonts/circe/Circe-Light.ttf": "9fd3216596f21252abbdbc053769134e",
"assets/assets/fonts/circe/Circe-Bold.ttf": "22f16521a7d16c7f8342680cf30b46bd",
"assets/assets/fonts/circe/Circe-Thin.ttf": "8a6928dabfc92fdf4fa5fa4f53534cab",
"assets/assets/screenshots/portfolio_design_1.png": "7d6b918c406123f221b50e48feea493f",
"assets/assets/screenshots/portfolio_design_3.png": "f24dd0da7633fba80106b2865358a785",
"assets/assets/screenshots/portfolio_mobile_1.gif": "6f5725083b4becfb8b77c2af45a7e165",
"assets/assets/screenshots/portfolio_3.gif": "a485ce18b008accbc91075f7aa27e2e7",
"assets/assets/screenshots/portfolio_2.gif": "4196cf51f9316273f9ef7bfefc97d20b",
"assets/assets/screenshots/portfolio_1.gif": "18dd0909f3aba633013d389421334c87",
"assets/assets/screenshots/portfolio_design_2.png": "711a86e370566ce01c1903db1aa4e794",
"assets/assets/images/associate_android_dev.png": "496dc53d08eec0434eeeae9887955ec8",
"assets/assets/images/aerium.jpg": "1cc46a5095ea0c7c487280dcd981d703",
"assets/assets/images/otp_package.jpg": "2a4d40fa2c2968e140a02b767002615e",
"assets/assets/images/login_catalog.jpg": "8142a609044c0f5b26df2964fe9304c4",
"assets/assets/images/vybz.jpg": "afc36c7d9f5cbaf04ca21d43cee72bce",
"assets/assets/images/david_legend.png": "b01ae00f2e9b1c9f8acd2294fed944d4",
"assets/assets/images/learn_upp.jpg": "45063d1af568d5f2ad55b3f6eb447233",
"assets/assets/images/onboarding_app.jpg": "3579b51a4590f083dd633d145196bd22",
"assets/assets/images/data_science_cert.png": "1364c23105bfbb8c9197f7ad1f9dd245",
"assets/assets/images/android_basics_cert.png": "3279aee63a95e1b4df4e4999364f8749",
"assets/assets/images/foodybite.jpg": "15fa08d9eea454b52afcd280aa044083",
"assets/assets/images/playstore.png": "18fab95d924ef304111a8efd2620c0a6",
"assets/assets/images/DAVID_COBBINA_CV.pdf": "0516a6d443027d43295e07518ea5c67a",
"assets/assets/images/finopp.jpg": "e8242ed7f425c6937f87d3a5526e76c5",
"assets/assets/images/colossal_toons.jpg": "309de4edc7e7540a0717710523e07477",
"assets/assets/images/david_legend_2.png": "4fe4eaad48d004e47c0b6f5dd02d1cf2",
"assets/assets/images/bequip_logistics.jpg": "d9a33516351b0bb9e7cadc83b8780c66",
"assets/AssetManifest.json": "2aed44f89e68643022cc3a5c9adbeb6e",
"assets/FontManifest.json": "bdd5ce6f199dd9c206f745254bec9bfd",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "eaed33dc9678381a55cb5c13edaf241d",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "ffed6899ceb84c60a1efa51c809a57e4",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "3241d1d9c15448a4da96df05f3292ffe",
"assets/packages/flutter_feather_icons/fonts/feather.ttf": "c96dc22ca29a082af83cce866d35cebc",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/NOTICES": "bf900feb65d3b2c4bfe4ad1e73019190",
"icons/logo-aerium-1.png": "c9c1749b275f61ebc563d6596ccf2569",
"icons/logo-aerium-2.png": "58b131c1e81194452cb702693c040a92",
"manifest.json": "2e28cebc1e27a999e5b0da349afad267",
"version.json": "e4516f16fbf3ecc92092f0f1d3c53171",
"main.dart.js": "01bf1f5840025f48d3aab7a92932b228",
"index.html": "0073b98ed7ce78d5f26176de165df644",
"/": "0073b98ed7ce78d5f26176de165df644"
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
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
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
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
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
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
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
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
