// This file can be replaced during build by using the `fileReplacements` array.
// `ng build ---prod` replaces `environment.ts` with `environment.prod.ts`.
// The list of file replacements can be found in `angular.json`.

export const environment = {
  production: false,
  appName: 'on-TRES',
  appDescription: 'One Touch Response Emergency System',
  firebase: {
    apiKey: 'AIzaSyANqfJV9tZL_e2FPuskx_IZ_uz5B4Q9OKc',
    authDomain: 'angel-hack-f10fb.firebaseapp.com',
    databaseURL: 'https://angel-hack-f10fb.firebaseio.com',
    projectId: 'angel-hack-f10fb',
    storageBucket: '',
    messagingSenderId: '139723233762'
  },
  agmMap: {
    apiKey: 'AIzaSyDq_WWAHugtciIQNr5jG97Yh9HVooMWr7k'
  }
};

/*
 * In development mode, to ignore zone related error stack frames such as
 * `zone.run`, `zoneDelegate.invokeTask` for easier debugging, you can
 * import the following file, but please comment it out in production mode
 * because it will have performance impact when throw error
 */
// import 'zone.js/dist/zone-error';  // Included with Angular CLI.
