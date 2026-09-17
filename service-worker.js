const CACHE_NAME = 'biblioteca-unifecaf-v1';
const TO_CACHE = [
  '/',
  '/biblioteca-unifecaf/index.html',
  '/biblioteca-unifecaf/catalog.html',
  '/biblioteca-unifecaf/book.html',
  '/biblioteca-unifecaf/css/style.css'
];
self.addEventListener('install', evt => {
  evt.waitUntil(caches.open(CACHE_NAME).then(cache => cache.addAll(TO_CACHE)).catch(()=>{}));
});
self.addEventListener('fetch', evt => {
  evt.respondWith(caches.match(evt.request).then(r => r || fetch(evt.request)));
});
