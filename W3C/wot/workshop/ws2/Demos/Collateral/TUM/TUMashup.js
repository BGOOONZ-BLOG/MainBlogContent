/*
This is a mashup that uses the devices of the red cart.

If you cover the light sensor:
The robot arm will turn right, > will be displayed on a sensehat and the HUE light on the right will turn on.

If there is enough light on the light sensor, the opposite will happen.

If you press the joystick, the Dotstar LEDs will light up with random colors.
*/

const Robot_TD_ADDRESS = "http://TUMEIESI-MeArmPi-Orange.local:8080/MeArmPi";
const LightSensor_TD_ADDRESS = "http://192.168.188.9/";
const senseHAT_TD_ADDRESS = "http://TUMEIESI-SenseHat-106.local:8080/SenseHat";
const strip_TD_ADDRESS = "http://TUMEIESI-DotStar.local:8080/";

var hueLamp1TD = JSON.stringify({
    "title": "Hue White Lamp 1",
    "id": "urn:dev:ops:32473-HueLight-1",
    "description": "This is a Philips Hue White Light Bulb that can be controlled remotely. It is configured for a specific router.",
    "@context": [
        "https://www.w3.org/2019/wot/td/v1",
        {
            "@language": "en"
        }
    ],
    "securityDefinitions": {
        "nosec_sc": {
            "scheme": "nosec"
        }
    },
    "security": [
        "nosec_sc"
    ],
    "properties": {
        "lightInformation": {
            "title": "State and Attributes Of Light",
            "description": "Gets the attributes and state of a given light",
            "type": "object",
            "properties": {
                "state": {
                    "description": "Details the state of the light, see the state table below for more details.",
                    "type": "object",
                    "properties": {
                        "on": {
                            "description": "On/Off state of the light. On=true, Off=false",
                            "type": "boolean",
                            "readOnly": true,
                            "writeOnly": false
                        },
                        "alert": {
                            "description": "The alert effect, which is a temporary change to the bulb’s state.'l' of lselect stands for loop.",
                            "type": "string",
                            "enum": [
                                "none",
                                "select",
                                "lselect"
                            ],
                            "readOnly": true,
                            "writeOnly": false
                        },
                        "bri": {
                            "description": "brightness level",
                            "type": "integer",
                            "minimum": 0,
                            "maximum": 254,
                            "readOnly": true,
                            "writeOnly": false
                        },
                        "reachable": {
                            "description": "Indicates if a light can be reached by the bridge",
                            "type": "boolean",
                            "readOnly": true,
                            "writeOnly": false
                        }
                    }
                },
                "type": {
                    "description": "A fixed name describing the type of light",
                    "type": "string",
                    "readOnly": true,
                    "writeOnly": false
                },
                "name": {
                    "description": "A unique, editable name given to the light",
                    "type": "string",
                    "readOnly": false,
                    "writeOnly": false
                },
                "modelid": {
                    "description": "The hardware model of the light.",
                    "type": "string",
                    "readOnly": true,
                    "writeOnly": false
                },
                "swversion": {
                    "description": "An identifier for the software version running on the light",
                    "type": "string",
                    "readOnly": true,
                    "writeOnly": false
                }
            },
            "forms": [{
                    "href": "http://Philips-hue.local/api/R6D7CYQFzXckikMPLEL8WbSZWg9XKkEyx-NrgKws/lights/1/",
                    "htv:methodName": "GET",
                    "http:methodName": "GET",
                    "contentType": "application/json",
                    "op": [
                        "readproperty"
                    ]
                },
                {
                    "href": "http://Philips-hue.local/api/R6D7CYQFzXckikMPLEL8WbSZWg9XKkEyx-NrgKws/lights/1/",
                    "htv:methodName": "PUT",
                    "contentType": "application/json",
                    "op": [
                        "writeproperty"
                    ]
                }
            ]
        }
    },
    "actions": {
        "rename": {
            "title": "Rename Light",
            "description": "A light can have its name changed when in any state, including when it is unreachable or off.",
            "input": {
                "type": "object",
                "properties": {
                    "name": {
                        "type": "string",
                        "minLength": 0,
                        "maxLength": 32
                    }
                }
            },
            "output": {
                "type": "array",
                "items": {
                    "type": "object",
                    "properties": {
                        "success": {
                            "type": "object",
                            "properties": {},
                            "additionalProperties": {
                                "type": "string"
                            }
                        }
                    }
                }
            },
            "forms": [{
                "href": "http://Philips-hue.local/api/R6D7CYQFzXckikMPLEL8WbSZWg9XKkEyx-NrgKws/lights/1/",
                "contentType": "application/json",
                "htv:methodName": "PUT",
                "op": [
                    "invokeaction"
                ]
            }],
            "idempotent": true,
            "safe": false
        },
        "set_state": {
            "title": "Set State",
            "description": "Allows the user to turn the light on and off, modify the hue and effects",
            "input": {
                "type": "object",
                "properties": {
                    "on": {
                        "description": "On/Off state of the light. On=true, Off=false",
                        "type": "boolean"
                    },
                    "bri": {
                        "description": "Brightness level. Accepts 255 as well",
                        "type": "integer",
                        "minimum": 0,
                        "maximum": 254
                    },
                    "alert": {
                        "description": "The alert effect, which is a temporary change to the bulb’s state.'l' of lselect stands for loop. Presence of lselect ignores transitiontime",
                        "type": "string",
                        "enum": [
                            "lselect",
                            "none",
                            "select"
                        ]
                    },
                    "transisiontime": {
                        "description": "The duration of the transition from the light’s current state to the new state.",
                        "type": "integer",
                        "unit": "100ms",
                        "minimum": 0,
                        "maximum": 65535
                    },
                    "bri_inc": {
                        "description": "Increments or decrements the value of the brightness.  bri_inc is ignored if the bri attribute is provided.",
                        "type": "integer",
                        "minimum": -254,
                        "maximum": 254
                    }
                }
            },
            "output": {
                "type": "array",
                "items": {
                    "type": "object",
                    "properties": {
                        "success": {
                            "oneOf": [{
                                    "type": "object",
                                    "properties": {
                                        "/lights/4/state/bri_inc": {
                                            "description": "Increments or decrements the value of the brightness.  bri_inc is ignored if the bri attribute is provided.",
                                            "type": "integer",
                                            "minimum": -254,
                                            "maximum": 254
                                        }
                                    }
                                },
                                {
                                    "type": "object",
                                    "properties": {
                                        "/lights/4/state/on": {
                                            "description": "On/Off state of the light. On=true, Off=false",
                                            "type": "boolean"
                                        }
                                    }
                                },
                                {
                                    "type": "object",
                                    "properties": {
                                        "/lights/4/state/bri": {
                                            "description": "brightness level",
                                            "type": "integer",
                                            "minimum": 0,
                                            "maximum": 254
                                        }
                                    }
                                },
                                {
                                    "type": "object",
                                    "properties": {
                                        "/lights/4/state/alert": {
                                            "description": "The alert effect, which is a temporary change to the bulb’s state.'l' of lselect stands for loop.",
                                            "type": "string",
                                            "enum": [
                                                "lselect",
                                                "none",
                                                "select"
                                            ]
                                        }
                                    }
                                },
                                {
                                    "type": "object",
                                    "properties": {
                                        "/lights/4/state/transisiontime": {
                                            "description": "The duration of the transition from the light’s current state to the new state.",
                                            "type": "integer",
                                            "minimum": 0,
                                            "maximum": 65535
                                        }
                                    }
                                }
                            ]
                        }
                    }
                }
            },
            "forms": [{
                "href": "http://Philips-hue.local/api/R6D7CYQFzXckikMPLEL8WbSZWg9XKkEyx-NrgKws/lights/1/state",
                "contentType": "application/json",
                "htv:methodName": "PUT",
                "op": [
                    "invokeaction"
                ]
            }],
            "idempotent": false,
            "safe": false
        }
    }
});

var hueLamp3TD = JSON.stringify({
    "title": "Hue White Lamp 3",
    "id": "urn:dev:ops:32473-HueLight-3",
    "description": "This is a Philips Hue White Light Bulb that can be controlled remotely. It is configured for a specific router.",
    "@context": [
        "https://www.w3.org/2019/wot/td/v1",
        {
            "@language": "en"
        }
    ],
    "securityDefinitions": {
        "nosec_sc": {
            "scheme": "nosec"
        }
    },
    "security": [
        "nosec_sc"
    ],
    "properties": {
        "lightInformation": {
            "title": "State and Attributes Of Light",
            "description": "Gets the attributes and state of a given light",
            "type": "object",
            "properties": {
                "state": {
                    "description": "Details the state of the light, see the state table below for more details.",
                    "type": "object",
                    "properties": {
                        "on": {
                            "description": "On/Off state of the light. On=true, Off=false",
                            "type": "boolean",
                            "readOnly": true,
                            "writeOnly": false
                        },
                        "alert": {
                            "description": "The alert effect, which is a temporary change to the bulb’s state.'l' of lselect stands for loop.",
                            "type": "string",
                            "enum": [
                                "none",
                                "select",
                                "lselect"
                            ],
                            "readOnly": true,
                            "writeOnly": false
                        },
                        "bri": {
                            "description": "brightness level",
                            "type": "integer",
                            "minimum": 0,
                            "maximum": 254,
                            "readOnly": true,
                            "writeOnly": false
                        },
                        "reachable": {
                            "description": "Indicates if a light can be reached by the bridge",
                            "type": "boolean",
                            "readOnly": true,
                            "writeOnly": false
                        }
                    }
                },
                "type": {
                    "description": "A fixed name describing the type of light",
                    "type": "string",
                    "readOnly": true,
                    "writeOnly": false
                },
                "name": {
                    "description": "A unique, editable name given to the light",
                    "type": "string",
                    "readOnly": false,
                    "writeOnly": false
                },
                "modelid": {
                    "description": "The hardware model of the light.",
                    "type": "string",
                    "readOnly": true,
                    "writeOnly": false
                },
                "swversion": {
                    "description": "An identifier for the software version running on the light",
                    "type": "string",
                    "readOnly": true,
                    "writeOnly": false
                }
            },
            "forms": [{
                    "href": "http://Philips-hue.local/api/R6D7CYQFzXckikMPLEL8WbSZWg9XKkEyx-NrgKws/lights/3/",
                    "htv:methodName": "GET",
                    "http:methodName": "GET",
                    "contentType": "application/json",
                    "op": [
                        "readproperty"
                    ]
                },
                {
                    "href": "http://Philips-hue.local/api/R6D7CYQFzXckikMPLEL8WbSZWg9XKkEyx-NrgKws/lights/3/",
                    "htv:methodName": "PUT",
                    "contentType": "application/json",
                    "op": [
                        "writeproperty"
                    ]
                }
            ]
        }
    },
    "actions": {
        "rename": {
            "title": "Rename Light",
            "description": "A light can have its name changed when in any state, including when it is unreachable or off.",
            "input": {
                "type": "object",
                "properties": {
                    "name": {
                        "type": "string",
                        "minLength": 0,
                        "maxLength": 32
                    }
                }
            },
            "output": {
                "type": "array",
                "items": {
                    "type": "object",
                    "properties": {
                        "success": {
                            "type": "object",
                            "properties": {},
                            "additionalProperties": {
                                "type": "string"
                            }
                        }
                    }
                }
            },
            "forms": [{
                "href": "http://Philips-hue.local/api/R6D7CYQFzXckikMPLEL8WbSZWg9XKkEyx-NrgKws/lights/3/",
                "contentType": "application/json",
                "htv:methodName": "PUT",
                "op": [
                    "invokeaction"
                ]
            }],
            "idempotent": true,
            "safe": false
        },
        "set_state": {
            "title": "Set State",
            "description": "Allows the user to turn the light on and off, modify the hue and effects",
            "input": {
                "type": "object",
                "properties": {
                    "on": {
                        "description": "On/Off state of the light. On=true, Off=false",
                        "type": "boolean"
                    },
                    "bri": {
                        "description": "Brightness level. Accepts 255 as well",
                        "type": "integer",
                        "minimum": 0,
                        "maximum": 254
                    },
                    "alert": {
                        "description": "The alert effect, which is a temporary change to the bulb’s state.'l' of lselect stands for loop. Presence of lselect ignores transitiontime",
                        "type": "string",
                        "enum": [
                            "lselect",
                            "none",
                            "select"
                        ]
                    },
                    "transisiontime": {
                        "description": "The duration of the transition from the light’s current state to the new state.",
                        "type": "integer",
                        "unit": "100ms",
                        "minimum": 0,
                        "maximum": 65535
                    },
                    "bri_inc": {
                        "description": "Increments or decrements the value of the brightness.  bri_inc is ignored if the bri attribute is provided.",
                        "type": "integer",
                        "minimum": -254,
                        "maximum": 254
                    }
                }
            },
            "output": {
                "type": "array",
                "items": {
                    "type": "object",
                    "properties": {
                        "success": {
                            "oneOf": [{
                                    "type": "object",
                                    "properties": {
                                        "/lights/4/state/bri_inc": {
                                            "description": "Increments or decrements the value of the brightness.  bri_inc is ignored if the bri attribute is provided.",
                                            "type": "integer",
                                            "minimum": -254,
                                            "maximum": 254
                                        }
                                    }
                                },
                                {
                                    "type": "object",
                                    "properties": {
                                        "/lights/4/state/on": {
                                            "description": "On/Off state of the light. On=true, Off=false",
                                            "type": "boolean"
                                        }
                                    }
                                },
                                {
                                    "type": "object",
                                    "properties": {
                                        "/lights/4/state/bri": {
                                            "description": "brightness level",
                                            "type": "integer",
                                            "minimum": 0,
                                            "maximum": 254
                                        }
                                    }
                                },
                                {
                                    "type": "object",
                                    "properties": {
                                        "/lights/4/state/alert": {
                                            "description": "The alert effect, which is a temporary change to the bulb’s state.'l' of lselect stands for loop.",
                                            "type": "string",
                                            "enum": [
                                                "lselect",
                                                "none",
                                                "select"
                                            ]
                                        }
                                    }
                                },
                                {
                                    "type": "object",
                                    "properties": {
                                        "/lights/4/state/transisiontime": {
                                            "description": "The duration of the transition from the light’s current state to the new state.",
                                            "type": "integer",
                                            "minimum": 0,
                                            "maximum": 65535
                                        }
                                    }
                                }
                            ]
                        }
                    }
                }
            },
            "forms": [{
                "href": "http://Philips-hue.local/api/R6D7CYQFzXckikMPLEL8WbSZWg9XKkEyx-NrgKws/lights/3/state",
                "contentType": "application/json",
                "htv:methodName": "PUT",
                "op": [
                    "invokeaction"
                ]
            }],
            "idempotent": false,
            "safe": false
        }
    }
});

WoT.fetch(Robot_TD_ADDRESS).then(async (robotTD) => {

    WoT.fetch(senseHAT_TD_ADDRESS).then(async (senseHatTD) => {

        WoT.fetch(LightSensor_TD_ADDRESS).then(async (lightSensorTD) => {

            WoT.fetch(strip_TD_ADDRESS).then(async (stripTD) => {

                robotThing = WoT.consume(robotTD);
                lightSensorThing = WoT.consume(lightSensorTD);
                senseHatThing = WoT.consume(senseHatTD);
                stripThing = WoT.consume(stripTD);
                hueLamp1Thing = WoT.consume(hueLamp1TD);
                hueLamp3Thing = WoT.consume(hueLamp3TD);

                stripThing.actions["shutdown"].invoke();
                senseHatThing.events.joystickPress.subscribe(x => {
                        stripThing.actions["random"].invoke();
                    },
                    e => {
                        console.log("onError: %s", e)
                    },
                    () => {
                        console.log("onCompleted");
                    }
                )

                setInterval(async () => {
                    var intensity = await lightSensorThing.properties.intensity.read();
                    if (intensity < 300) {
                        robotThing.actions["closeGrip"].invoke();
                        robotThing.actions["moveBaseTo"].invoke(35);
                        senseHatThing.actions["flashMessage"].invoke({
                            "textString": "<"
                        });
                        hueLamp3Thing.actions["set_state"].invoke({
                            "on": true,
                            "bri": 250
                        });
                        hueLamp1Thing.actions["set_state"].invoke({
                            "on": false
                        });
                    } else {
                        robotThing.actions["openGrip"].invoke();
                        robotThing.actions["moveBaseTo"].invoke(-35);
                        senseHatThing.actions["flashMessage"].invoke({
                            "textString": ">"
                        });
                        hueLamp1Thing.actions["set_state"].invoke({
                            "on": true,
                            "bri": 250
                        });
                        hueLamp3Thing.actions["set_state"].invoke({
                            "on": false
                        })
                    }
                }, 200);
            });
        });
    });
})