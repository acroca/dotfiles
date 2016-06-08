var screen0 = slate.operation('throw', {
  "screen": "0",
  "width": "screenSizeX",
  "height": "screenSizeY"
});
var screen1 = slate.operation('throw', {
  "screen": "1",
  "width": "screenSizeX",
  "height": "screenSizeY"
});
var screen2 = slate.operation('throw', {
  "screen": "2",
  "width": "screenSizeX",
  "height": "screenSizeY"
});

slate.layout('main', {
  'Google Chrome': {repeat: true, operations: [screen0]},
  'Firefox': {repeat: true, operations: [screen0]},
  'Slack': {repeat: true, operations: [screen0]},
  'Spotify': {repeat: true, operations: [screen0]},
  'Calendar': {repeat: true, operations: [screen0]},
  'WhatsApp': {repeat: true, operations: [screen0]},

  'MacVim': {repeat: true, operations: [screen1]},
  'Sublime Text': {repeat: true, operations: [screen1]},

  'Terminal': {repeat: true, operations: [screen2]},
  'Unity': {repeat: true, operations: [screen2]},
});

slate.bind('left:alt,ctrl,cmd', slate.operation('push', {
  direction: 'left',
  style: 'bar-resize:screenSizeX/2'
}));
slate.bind('right:alt,ctrl,cmd', slate.operation('push', {
  direction: 'right',
  style: 'bar-resize:screenSizeX/2'
}));
slate.bind('up:alt,ctrl,cmd', slate.operation('push', {
  direction: 'up',
  style: 'bar-resize:screenSizeY/2'
}));
slate.bind('down:alt,ctrl,cmd', slate.operation('push', {
  direction: 'down',
  style: 'bar-resize:screenSizeY/2'
}));
slate.bind('m:alt,ctrl,cmd',slate.operation('move', {
  x: 'screenOriginX',
  y: 'screenOriginY',
  width: 'screenSizeX',
  height: 'screenSizeY'
}));
slate.bind('n:alt,ctrl,cmd',slate.operation('move', {
  x: 'screenSizeX*0.2',
  y: 'screenSizeY*0.1',
  width: 'screenSizeX*0.6',
  height: 'screenSizeY*0.8'
}));

slate.bind(",:alt,ctrl,cmd", slate.operation('throw', {
  "screen": "0",
  "width": "screenSizeX",
  "height": "screenSizeY"
}));
slate.bind(".:alt,ctrl,cmd", slate.operation('throw', {
  "screen": "1",
  "width": "screenSizeX",
  "height": "screenSizeY"
}));
slate.bind("/:alt,ctrl,cmd", slate.operation('throw', {
  "screen": "2",
  "width": "screenSizeX",
  "height": "screenSizeY"
}));
slate.bind("w:alt,ctrl,cmd", slate.operation('layout', {"name": "main"}));

slate.bind("1:cmd",  function(win) {
  if (win.app().name() === "Sublime Text") {
    slate.operation("focus", {"app": "Unity"}).run();
  } else {
    slate.operation("focus", {"app": "Sublime Text"}).run();
  }
});
slate.bind("2:cmd", slate.operation("focus", {"app": "Terminal"}));
slate.bind("3:cmd", slate.operation("focus", {"app": "Google Chrome"}));
slate.bind("4:cmd", function(win) {
  if (win.app().name() === "Slack") {
    slate.operation("focus", {"app": "WhatsApp"}).run();
  } else {
    slate.operation("focus", {"app": "Slack"}).run();
  }
});
