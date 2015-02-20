import QtQuick 2.3
import QtQuick.Particles 2.0

Item {
	id: spinner;

	property int count: 1;
	property int border: 60;
	property color color: '#00d4ff';
	property int duration: 3000;
	property var easingType: Easing.Linear;
	property real from: 0;
	property real to: 360;

	property real unitAngle: 360 / spinner.count;
	property real angleMarginFactor: 0;

	Item {
		id: circle;
		anchors.fill: parent;

		property real angleOffset: 0;

		Circle {
			anchors.fill: parent;
			color: spinner.color;
			border: spinner.border;
			mark: spinner.count;
			angleMarginFactor: spinner.angleMarginFactor;
/*
			SequentialAnimation on color {
				loops: Animation.Infinite
				running: true

				ColorAnimation {
					duration: spinner.duration;
					to: 'red';
				}

				ColorAnimation {
					duration: spinner.duration;
					to: spinner.color;
				}
			}
*/
		}

		transform: Rotation {
			origin.x: spinner.width * 0.5;
			origin.y: spinner.height * 0.5;
			angle: 0;

			SequentialAnimation on angle {
				loops: Animation.Infinite
				running: true

				NumberAnimation {
					duration: spinner.duration;
					easing.type: spinner.easingType;
					from: spinner.from;
					to: spinner.to;
				}
			}
		}

/*
		SequentialAnimation on angleOffset {
			loops: Animation.Infinite
			running: true

			NumberAnimation {
				duration: spinner.duration;
				from: spinner.from;
				to: spinner.to;
			}
		}
*/
	}
/*
	ParticleSystem {
		id: sys1
	}

	ImageParticle {
		system: sys1
		source: 'qrc:///particleresources/glowdot.png'
		color: 'cyan'
		alpha: 0
		SequentialAnimation on color {
			loops: Animation.Infinite
			ColorAnimation {
				from: 'cyan'
				to: 'magenta'
				duration: 1000
			}
			ColorAnimation {
				from: 'magenta'
				to: 'blue'
				duration: 2000
			}
			ColorAnimation {
				from: 'blue'
				to: 'violet'
				duration: 2000
			}
			ColorAnimation {
				from: 'violet'
				to: 'cyan'
				duration: 2000
			}

		}
		colorVariation: 0.3
	}

	Emitter {
		id: trailsNormal
		system: sys1

		emitRate: 500
		lifeSpan: 4000

		y: circlePath.cy
		x: circlePath.cx

		velocity: PointDirection { xVariation: 4; yVariation: 4; }
		acceleration: PointDirection {xVariation: 10; yVariation: 10;}
		velocityFromMovement: 8

		size: 16;
		sizeVariation: 8
	}

	Item {
		id: circlePath
		property int circleSize: spinner.height;
		property int interval: spinner.duration;
		property real radius: circleSize * 0.5 - spinner.border;
		property real dx: parent.width / 2
		property real dy: parent.height / 2
		property real cx: radius * Math.sin(percent * 6.283185307179) + dx
		property real cy: radius * Math.cos(percent * 6.283185307179) + dy
		property real percent: 0

		SequentialAnimation on percent {
			loops: Animation.Infinite
			running: true

			NumberAnimation {
				duration: circlePath.interval;
				from: spinner.to / 360;
				to: spinner.from / 360
				loops: 8
			}
		}
	}
*/
}
