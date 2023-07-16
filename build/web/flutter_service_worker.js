'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "e37fef0dd2b934404a5cb5557e03b631",
"assets/assets/fonts/poppins/Poppins-Black.ttf": "9a3a3c0803219892727ed9d85ad5caea",
"assets/assets/fonts/poppins/Poppins-Bold.ttf": "124cd57d8f41f6db22a724f882dca3f4",
"assets/assets/fonts/poppins/Poppins-ExtraBold.ttf": "4252dae8574e434c7bb0127b8ffd06df",
"assets/assets/fonts/poppins/Poppins-ExtraLight.ttf": "a0f2eadb0002101ea5da28381ce16cde",
"assets/assets/fonts/poppins/Poppins-Italic.ttf": "07502c4fe46025097dd8b1e331182ee0",
"assets/assets/fonts/poppins/Poppins-Light.ttf": "1bb10326b972c92be6c59c048a4327e4",
"assets/assets/fonts/poppins/Poppins-Medium.ttf": "614a91afc751f09d049231f828801c20",
"assets/assets/fonts/poppins/Poppins-Regular.ttf": "cd6b896a19b4babd1a2fa07498e9fc47",
"assets/assets/fonts/poppins/Poppins-SemiBold.ttf": "0fc985df77c6b59d37e79b97ed7fb744",
"assets/assets/images/certificates/deep_learning.jpg": "9a6cc3a0d5e5a51205ca2364ad9f5a2a",
"assets/assets/images/certificates/graphql.jpg": "29bef6e2f34cc3eb1e24230a1ead491f",
"assets/assets/images/certificates/intermediate_python.jpg": "b6464ffce448b572932192c728075fdd",
"assets/assets/images/certificates/jst_japan_asia.jpg": "41b3fbad48bb6d344a8774702ad86da9",
"assets/assets/images/certificates/tmesek.jpg": "ecb7b17281f8b8e4d9d85e201bbb51df",
"assets/assets/images/personal/complexity.svg": "2b6a4aa456cc8fda14db9804d7e5c0f7",
"assets/assets/images/personal/earth.svg": "cfcd9e658e8b4548820c598cbd9ea1e9",
"assets/assets/images/personal/galaxy.svg": "b3eee09b3b7e4c2d46b48d7251a1172f",
"assets/assets/images/personal/logo.svg": "13059153710dd620889088f8191b579c",
"assets/assets/images/personal/me.jpg": "37b63c916cd7ad612cbccfc89c0ab3e7",
"assets/assets/images/personal/mess.svg": "6c13bd3540f354d6b8376d17911899df",
"assets/assets/images/personal/message.svg": "55bd26bc88a2ecf027393d4c4739239b",
"assets/assets/images/personal/my_showcase_style.png": "fd2046d5be95e74315dd698621cd9bb9",
"assets/assets/images/personal/work_stump.svg": "684a3c3fc14a439acce9ebbddd1118da",
"assets/assets/images/projects/ai_chat_bot.png": "9d41e8eb12bb98afd6007d8a788839df",
"assets/assets/images/projects/animated_buttons.png": "6adf04371ccfdb14959e97d8eee42250",
"assets/assets/images/projects/design_patterns.png": "0274f5986b14139edd72021ccbd1326c",
"assets/assets/images/projects/ggone.jpg": "4212f1730f81119ff06eb14a10a8d36a",
"assets/assets/images/projects/graphql_notes.png": "45eda8f8a37c58819a6100631b8c7465",
"assets/assets/images/projects/iron_man.png": "8708dc927d907d844431378307225a16",
"assets/assets/images/projects/notee.png": "264a912225cccd84854bd8ffe39658b3",
"assets/assets/images/projects/pulse_x.png": "4583c5c8f45338f72f4ac6001faff5ca",
"assets/assets/images/projects/the_golden_land.png": "c862492f15f121d0f849779928c76f74",
"assets/assets/images/projects/thread.png": "23c161c332c9518d5a6910b17d70d814",
"assets/assets/images/tools/dart.svg": "77736b70355db3b992d712891749acd5",
"assets/assets/images/tools/flutter.svg": "749737f954a8acaae1b3d389b3fc857f",
"assets/assets/images/tools/graphql.svg": "fa9917f65a8a054a150ed6cc318b163d",
"assets/assets/images/tools/html5.svg": "6f3d69949ef38223d94a5a78a0ecd6ca",
"assets/assets/images/tools/python.svg": "85368627053aa7df8e1340c0f29acdb8",
"assets/assets/images/van_gogh/blossom.jpg": "edd66f35236f9c40230f1661b6f591ba",
"assets/assets/images/van_gogh/irises.jpg": "635508d65ecf46f0d10fe99c3a7e0633",
"assets/assets/images/van_gogh/the-harvest.jpg": "728eeed80696e11c7aa2bd300a5c91e3",
"assets/assets/images/van_gogh/the-potato-eaters.jpg": "6b3d9a5439c71c19f48d5c212af731cc",
"assets/assets/images/van_gogh/the-starry-night.jpg": "e6510bbbc3323389a97301589c1d23f1",
"assets/assets/images/van_gogh/wheat-field-with-cypresses.jpg": "840970e2bd83dc59ffdf05e29f9ed5e4",
"assets/FontManifest.json": "df5f4d360456d5a89ecf64dd97102d2b",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/NOTICES": "99e46ca1765b927158912d2a53c8a39e",
"assets/packages/atlas_icons/lib/fonts/achievement/achievement.ttf": "e1b08e8a7e410f294433f4e269628c39",
"assets/packages/atlas_icons/lib/fonts/arrow/arrow.ttf": "0f15d0189ea5620d687d7949369e74aa",
"assets/packages/atlas_icons/lib/fonts/audio/audio.ttf": "c3e5ce807bd469a25d66a20f2aa02622",
"assets/packages/atlas_icons/lib/fonts/basic-ui/basic-ui.ttf": "e7ed3a5dd16bd30ecb3c070dabff0234",
"assets/packages/atlas_icons/lib/fonts/business-finance/business-finance.ttf": "41f5c5440e59f8b09fe06aaa40c89c18",
"assets/packages/atlas_icons/lib/fonts/christmas/christmas.ttf": "8ef65581efd6ac8f5eab01b0894a0acc",
"assets/packages/atlas_icons/lib/fonts/cinema/cinema.ttf": "7e0853dec8fb086ada0154112160e478",
"assets/packages/atlas_icons/lib/fonts/communication/communication.ttf": "f2c64be2640e8e30c84087f6b469562b",
"assets/packages/atlas_icons/lib/fonts/construction/construction.ttf": "9e79bc07af1be2c6d48a63056594c64c",
"assets/packages/atlas_icons/lib/fonts/content-box/content-box.ttf": "dcfc4c5f504f3e95ca4400292d46f179",
"assets/packages/atlas_icons/lib/fonts/data-document/data-document.ttf": "e4a03a731841a7b1079bd73d46556ab0",
"assets/packages/atlas_icons/lib/fonts/ecology/ecology.ttf": "32c288d5a2e9c6d6ad6abe583f2cbd1f",
"assets/packages/atlas_icons/lib/fonts/electronic-gadget/electronic-gadget.ttf": "090fa208a3106edfff22f1725ec0a182",
"assets/packages/atlas_icons/lib/fonts/fitness-gym/fitness-gym.ttf": "acabeea2f6ce168e5f6891d493f84917",
"assets/packages/atlas_icons/lib/fonts/food-beverage/food-beverage.ttf": "23f7bcffc4fe10bf1d77cca75bdc8d56",
"assets/packages/atlas_icons/lib/fonts/furniture/furniture.ttf": "67545f5182a76ffe74d00bbd8b250469",
"assets/packages/atlas_icons/lib/fonts/goals/goals.ttf": "e4d179f663797313774dc6bc75e7a048",
"assets/packages/atlas_icons/lib/fonts/hand-gesture/hand-gesture.ttf": "fc3e38c5b67025daadf749b02ba50fbf",
"assets/packages/atlas_icons/lib/fonts/hotel-service/hotel-service.ttf": "c4783315d57bfe36c9922183e5c49e6f",
"assets/packages/atlas_icons/lib/fonts/internet-security/internet-security.ttf": "7a06e8ad89de009688e3ad358a9361e9",
"assets/packages/atlas_icons/lib/fonts/laboratory/laboratory.ttf": "fff2c45f5992e6a2bc04423909d750fa",
"assets/packages/atlas_icons/lib/fonts/leadership/leadership.ttf": "a0cd3d5656eab9f86db4236690f59b06",
"assets/packages/atlas_icons/lib/fonts/love/love.ttf": "13b72a817d53c33888b53278d0fef893",
"assets/packages/atlas_icons/lib/fonts/marketing/marketing.ttf": "28377c1e38705f673978a64934425d7a",
"assets/packages/atlas_icons/lib/fonts/medical/medical.ttf": "1c4198c63318b2edb70c4bf4faa15466",
"assets/packages/atlas_icons/lib/fonts/partnership/partnership.ttf": "bf826a19a7bf4d66c4548ddc9dabeebb",
"assets/packages/atlas_icons/lib/fonts/personal-development/personal-development.ttf": "4d0afee20064e1394c0c1ca354f0f797",
"assets/packages/atlas_icons/lib/fonts/real-estate/real-estate.ttf": "c5a2072f7adc14a77b0f3620bd8db192",
"assets/packages/atlas_icons/lib/fonts/school/school.ttf": "458aa69b33dfd3da0b19d3aa3ca80f63",
"assets/packages/atlas_icons/lib/fonts/social/social.ttf": "71b24245668da6394aa36131c49a91c4",
"assets/packages/atlas_icons/lib/fonts/sport/sport.ttf": "9c1d430c14fae02afc8b5f43e368dc10",
"assets/packages/atlas_icons/lib/fonts/thanksgiving/thanksgiving.ttf": "d6f17efebac6d84017dbcb3d745caf85",
"assets/packages/atlas_icons/lib/fonts/transportation/transportation.ttf": "b2b665b6ec8ede87efb9e889c41a6c56",
"assets/packages/atlas_icons/lib/fonts/travel/travel.ttf": "ff86d75e8f11d86e2aacee84838b47c7",
"assets/packages/atlas_icons/lib/fonts/virtual-reality/virtual-reality.ttf": "653755b0712a9a503e196038e165d5fb",
"assets/packages/atlas_icons/lib/fonts/weather/weather.ttf": "76d93232ac0a6fa22eea9b9f113cb554",
"assets/packages/atlas_icons/lib/fonts/web-design/web-design.ttf": "09edfdce131bd77cacb4bd17ae1a6bc8",
"assets/packages/atlas_icons/lib/fonts/winter/winter.ttf": "0692e7907d1c1f6b1a5e470c52a69d5a",
"assets/packages/atlas_icons/lib/fonts/working-together/working-together.ttf": "51a5c7fdb1dd4cfd4e0738472a9816d0",
"assets/packages/atlas_icons/lib/fonts/world-monuments/world-monuments.ttf": "4b7a327e6928e5ecce9409b1d78860e6",
"assets/packages/atlas_icons/lib/fonts/yoga/yoga.ttf": "97a2bf2e6a9932750176b6b50017fa17",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "b00363533ebe0bfdb95f3694d7647f6d",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "0a94bab8e306520dc6ae14c2573972ad",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "9cda082bd7cc5642096b56fa8db15b45",
"canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "1cfe996e845b3a8a33f57607e8b09ee4",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "685367268772719d9493739d9cdb138e",
"/": "685367268772719d9493739d9cdb138e",
"main.dart.js": "f3508efe3af280293b671349d05e2303",
"manifest.json": "697ec757cdb507f73aac8fefdd8e6282",
"version.json": "c3cc0a6dda4f455504c3085042ef70e2"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
