library service;

import 'dart:async';

import 'package:service_worker/worker.dart';

void _log(Object o) => print('WORKER: $o');

void main() {

  var id = 0;

  _log('SW started.');

  onInstall.listen((InstallEvent event) {
    _log('Installing.');
    event.waitUntil(_initCache());
  });

  onActivate.listen((ExtendableEvent event) {
    _log('Activating.');
  });

  onFetch.listen((FetchEvent event) {
    _log('Fetch request for $id: ${event.request.url}');
    event.respondWith(_getCachedOrFetch(id, event.request));
    id++;
  });

  onMessage.listen((ExtendableMessageEvent event) {
    _log('Message received: `${event.data}`');
    event.source.postMessage('reply from SW');
    _log('Sent reply');
  });

  onPush.listen((PushEvent event) {
    _log('onPush received: `${event.data.text()}`');
    registration.showNotification('Notification: ${event.data}');
  });
}

Future<Response> _getCachedOrFetch(int id, Request request) async {
  _log('  Checking for $id: ${request.url}');
  var r = await caches.match(request);
  if (r != null) {
    _log('  $id: Found in cache');
    return r;
  } else {
    _log('  $id: No cached version. Fetching: ${request.url}');
    r = await fetch(request);
    _log('  $id: Got for ${request.url}: ${r.statusText}');
  }
  return r;
}

Future _initCache() async {
  _log('Init cache...');
  try {
    Cache cache = await caches.open('offline-v1');
  await cache.addAll([
    '/index.html',
    '/main.dart.js',
    '/styles.css'
  ]);
  } catch (e) {
    _log('Cache initialising exception. `$e`');
  }
  
  _log('Cache initialized.');
}
