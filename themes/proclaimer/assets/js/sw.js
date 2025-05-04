self.addEventListener('install', (event) => {
  const cacheKey = 'FancyServerWorkerCache_v1';

  event.waitUntil(caches.open(cacheKey).then((cache) => {
    // Add all the assets in the array to the 'FancyServerWorkerCache_v1' `Cache` instance for later use.
    return cache.addAll([
      '/css/nanogallery2.min.css',
      '/js/fuse.min.js',
      '/js/jquery.min.js',
      '/js/jquery.nanogallery2.min.js',
      '/js/main.js',
      '/js/search.js',
      '/js/mark.min.js'
    ]);
  }));
});
