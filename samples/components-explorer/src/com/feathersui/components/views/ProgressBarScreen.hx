package com.feathersui.components.views;

import feathers.controls.Button;
import feathers.controls.HProgressBar;
import feathers.controls.Label;
import feathers.controls.LayoutGroup;
import feathers.controls.Panel;
import feathers.controls.VProgressBar;
import feathers.events.TriggerEvent;
import feathers.layout.AnchorLayout;
import feathers.layout.AnchorLayoutData;
import openfl.events.Event;

class ProgressBarScreen extends Panel {
	private var horizontalProgress:HProgressBar;
	private var verticalProgress:VProgressBar;

	override private function initialize():Void {
		super.initialize();

		this.layout = new AnchorLayout();

		this.headerFactory = function():LayoutGroup {
			var header = new LayoutGroup();
			header.variant = LayoutGroup.VARIANT_TOOL_BAR;
			header.layout = new AnchorLayout();

			var headerTitle = new Label();
			headerTitle.variant = Label.VARIANT_HEADING;
			headerTitle.text = "Progress Bar";
			headerTitle.layoutData = AnchorLayoutData.center();
			header.addChild(headerTitle);

			var backButton = new Button();
			backButton.text = "Back";
			backButton.layoutData = new AnchorLayoutData(null, null, null, 10, null, 0);
			backButton.addEventListener(TriggerEvent.TRIGGER, backButton_triggerHandler);
			header.addChild(backButton);

			return header;
		};

		this.horizontalProgress = new HProgressBar();
		this.horizontalProgress.minimum = 0.0;
		this.horizontalProgress.maximum = 100.0;
		this.horizontalProgress.value = 45.0;
		this.horizontalProgress.layoutData = AnchorLayoutData.center(-40);
		this.addChild(this.horizontalProgress);

		this.verticalProgress = new VProgressBar();
		this.verticalProgress.minimum = 0.0;
		this.verticalProgress.maximum = 100.0;
		this.verticalProgress.value = 45.0;
		this.verticalProgress.layoutData = AnchorLayoutData.center(120);
		this.addChild(this.verticalProgress);
	}

	private function backButton_triggerHandler(event:TriggerEvent):Void {
		this.dispatchEvent(new Event(Event.COMPLETE));
	}
}
