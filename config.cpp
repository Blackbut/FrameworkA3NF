// Control types
#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_SLIDER           3
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_TOOLBOX          6
#define CT_CHECKBOXES       7
#define CT_PROGRESS         8
#define CT_HTML             9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT       11
#define CT_TREE             12
#define CT_STRUCTURED_TEXT  13
#define CT_CONTEXT_MENU     14
#define CT_CONTROLS_GROUP   15
#define CT_SHORTCUT_BUTTON  16

#define CT_XKEYDESC         40
#define CT_XBUTTON          41
#define CT_XLISTBOX         42
#define CT_XSLIDER          43
#define CT_XCOMBO           44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT           80
#define CT_OBJECT_ZOOM      81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK        98
#define CT_USER             99
#define CT_MAP              100
#define CT_MAP_MAIN         101
#define CT_List_N_Box       102


// Static styles
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0c

#define ST_TYPE           0xF0
#define ST_SINGLE         0
#define ST_MULTI          16
#define ST_TITLE_BAR      32
#define ST_PICTURE        48
#define ST_FRAME          64
#define ST_BACKGROUND     80
#define ST_GROUP_BOX      96
#define ST_GROUP_BOX2     112
#define ST_HUD_BACKGROUND 128
#define ST_TILE_PICTURE   144
#define ST_WITH_RECT      160
#define ST_LINE           176

#define ST_SHADOW         0x100
#define ST_NO_RECT        0x200
#define ST_KEEP_ASPECT_RATIO  0x800

#define ST_TITLE          ST_TITLE_BAR + ST_CENTER

// Slider styles
#define SL_DIR            0x400
#define SL_VERT           0
#define SL_HORZ           0x400

#define SL_TEXTURES       0x10

// Listbox styles
#define LB_TEXTURES       0x10
#define LB_MULTI          0x20


class MyRscPicture {
	idc = -1;
	type = CT_STATIC;
	style = ST_PICTURE;
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {1, 1, 1, 1};
	font = "Zeppelin32";
	sizeEx = 0.035;
	text = "";
};    

class MyRscBox {
	idc = -1;
	type = CT_STATIC;
	style = ST_CENTER;
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {0.9, 0.9, 0.9, 1};
	w = 0.2;
	h = 0.05;
	font = "PuristaBold";
	sizeEx = 0.025;
	text = "";
};

class MyRscStructuredText {
	idc = -1; 
	type = CT_STRUCTURED_TEXT;
	style = ST_LEFT;
	colorBackground[] = { 1, 1, 1, 0.7 }; 
	x = 0.1; 
	y = 0.1; 
	w = 0.3; 
	h = 0.1; 
	size = 0.023;
	text = "";
	class Attributes {
		font = "PuristaBold";
		color = "#FFFFFF";
		align = "left";
		valign = "left";
		shadow = true;
		shadowColor = "#818181";
		size = "1.3";
	};
};

class RscEdit {
	idc = -1;
	type = CT_EDIT;
	style = ST_LEFT;
	autocomplete = false;
	colorBackground[] = {0, 0, 0, 0};
	colorSelection[] = {1,1,1,0.5};
	colorText[] = {0.9, 0.9, 0.9, 1};
	w = 0.125;
	h = 0.05;
	font = "TahomaB";
	sizeEx = 0.025;
	text = "";
};

class RscListBox
{
	access = 0;
	type = 5;
	style = 0;
	w = 0.4;
	h = 0.4;
	font = "TahomaB";
	sizeEx = 0.028;
	rowHeight = 0;
	colorText[] = {1,1,1,1};
	colorScrollbar[] = {1,1,1,1};
	colorSelect[] = {0,0,0,1};
	colorSelect2[] = {1,0.5,0,1};
	colorSelectBackground[] = {0.6,0.6,0.6,1};
	colorSelectBackground2[] = {0.2,0.2,0.2,1};
	colorBackground[] = {0,0,0,1};
	maxHistoryDelay = 1.0;
	soundSelect[] = {"",0.1,1};
	period = 1;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
	arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
	shadow = 0;
	class ScrollBar
	{
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		thumb = "#(argb,8,8,3)color(1,1,1,1)";
		arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
		arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
		border = "#(argb,8,8,3)color(1,1,1,1)";
		shadow = 0;
	};
};

class MyRscMapControl { 
	access = 0; 
	idc = 10023; 
	type = CT_MAP_MAIN; 
	style = ST_PICTURE; 
	x = 0.05; y = 0.05; 
	w = 0.90; h = 0.90;  
	colorBackground[] = {0.80, 0.80, 0.60, 1.00}; 
	colorText[] = {0.00, 0.00, 0.00, 1.00}; 
	colorSea[] = {0.00, 0.35, 0.50, 0.8}; 
	colorForest[] = {0.10, 0.50, 0.10, 0}; 
	colorRocks[] = {0.50, 0.50, 0.50, 0}; 
	colorCountlines[] = {0, 0.3, 0, 0.75}; 
	colorMainCountlines[] = {0.5, 0, 0, 0.75}; 
	colorCountlinesWater[] = {0.00, 0.33, 1.00, 0.25}; 
	colorMainCountlinesWater[] = {0.00, 0.53, 1.00, 0.50}; 
	colorForestBorder[] = {0.00, 0.80, 0.00, 0.50}; 
	colorRocksBorder[] = {0.50, 0.50, 0.50, 0}; 
	colorPowerLines[] = {0.10, 0.10, 0.10, 0.70}; 
	colorNames[] = {0.00, 0.00, 0.00, 0.80}; 
	colorInactive[] = {1.00, 1.00, 1.00, 0}; 
	colorLevels[] = {0.00, 0.00, 0.00, 0.50}; 
	colorOutside[] = { 1, 1, 1, 1};
	colorRailWay[] = {1, 0, 0.5, 0};
	/*
	colorSea[] = {0.00, 0.35, 0.50, 0.60}; 
	colorForest[] = {0.10, 0.50, 0.10, 0.50}; 
	colorRocks[] = {0.50, 0.50, 0.50, 0.50}; 
	colorCountlines[] = {0.65, 0.45, 0.27, 0.50}; 
	colorMainCountlines[] = {0.65, 0.45, 0.27, 1.00}; 
	colorCountlinesWater[] = {0.00, 0.53, 1.00, 0.50}; 
	colorMainCountlinesWater[] = {0.00, 0.53, 1.00, 1.00}; 
	colorForestBorder[] = {0.40, 0.80, 0.00, 1.00}; 
	colorRocksBorder[] = {0.50, 0.50, 0.50, 1.00}; 
	colorPowerLines[] = {0.00, 0.00, 0.00, 1.00}; 
	colorNames[] = {0.00, 0.00, 0.00, 1.00}; 
	colorInactive[] = {1.00, 1.00, 1.00, 0.50}; 
	colorLevels[] = {0.00, 0.00, 0.00, 1.00}; 
	colorOutside[] = { 1, 1, 1, 1};
	colorRailWay[] = {1, 0, 0.5, 1};
	*/
	alphaFadeStartScale = 1;
	alphaFadeEndScale = 2;
	font = "TahomaB"; 
	sizeEx = 0.040000; 
	fontLabel = "TahomaB"; 
	sizeExLabel = 0.02; 
	fontGrid = "TahomaB"; 
	sizeExGrid = 0.02; 
	fontUnits = "TahomaB"; 
	sizeExUnits = 0.02; 
	fontNames = "TahomaB"; 
	sizeExNames = 0.04; 
	fontInfo = "TahomaB"; 
	sizeExInfo = 0.02; 
	fontLevel = "TahomaB"; 
	sizeExLevel = 0.02; 
	stickX[] = {0.20, {"Gamma", 1.00, 1.50} }; 
	stickY[] = {0.20, {"Gamma", 1.00, 1.50} }; 
	ptsPerSquareSea = 6; 
	ptsPerSquareTxt = 8; 
	ptsPerSquareCLn = 8; 
	ptsPerSquareExp = 8; 	
	ptsPerSquareCost = 8; 
	ptsPerSquareFor = "4.0f"; 
	ptsPerSquareForEdge = "10.0f"; 
	ptsPerSquareRoad = 2; 
	ptsPerSquareObj = 10; 
	maxSatelliteAlpha = 0.8;
	text = "\ca\ui\data\map_background2_co.paa"; //TODO
	showCountourInterval=2; 
	scaleDefault = 0.1; 
	onMouseButtonClick = ""; 
	onMouseButtonDblClick = ""; 

	class ActiveMarker { 
		color[] = {0.30, 0.10, 0.90, 1.00}; 
		size = 50; 
	}; 
	class Bunker { 
		icon = "\ca\ui\data\map_bunker_ca.paa"; 
		color[] = {0.00, 0.35, 0.70, 1.00}; 
		size = 14; 
		importance = "1.5 * 14 * 0.05"; 
		coefMin = 0.25; 
		coefMax = 4.00; 
	}; 
	class Bush { 
		icon = "\ca\ui\data\map_bush_ca.paa"; 
		color[] = {0.55, 0.64, 0.43, 1.00}; 
		size = 14; 
		importance = "0.2 * 14 * 0.05"; 
		coefMin = 0.25; 
		coefMax = 4.00; 
	}; 
	class BusStop { 
		icon = "\ca\ui\data\map_busstop_ca.paa"; 
		color[] = {0.00, 0.00, 1.00, 1.00}; 
		size = 10; 
		importance = "1 * 10 * 0.05"; 
		coefMin = 0.25; 
		coefMax = 4.00; 
	}; 
	class Command { 
		icon = "#(argb,8,8,3)color(1,1,1,1)"; 
		color[] = {0.00, 0.00, 0.00, 1.00}; 
		size = 18; 
		importance = 1.00; 
		coefMin = 1.00; 
		coefMax = 1.00; 
	}; 
	class Cross { 
		icon = "\ca\ui\data\map_cross_ca.paa"; 
		color[] = {0.00, 0.35, 0.70, 1.00}; 
		size = 16; 
		importance = "0.7 * 16 * 0.05"; 
		coefMin = 0.25; 
		coefMax = 4.00; 
	};	
	class Chapel { 
		icon = "\ca\ui\data\map_chapel_ca.paa"; 
		color[] = {0.00, 0.35, 0.70, 1.00}; 
		size = 16; 
		importance = "1 * 16 * 0.05"; 
		coefMin = 0.90; 
		coefMax = 4.00; 
	}; 
	class Church { 
		icon = "\ca\ui\data\map_church_ca.paa"; 
		color[] = {0.00, 0.35, 0.70, 1.00}; 
		size = 16; 
		importance = "2 * 16 * 0.05"; 
		coefMin = 0.90; 
		coefMax = 4.00; 
	};
	class CustomMark {
		icon = "\ca\ui\data\map_cross_ca.paa";
		color[] = {0.55, 0.64, 0.43, 1};
		size = 16;
		importance = 0.7 * 16 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
	};
	class Fortress { 
		icon = "\ca\ui\data\map_bunker_ca.paa"; 
		color[] = {0.00, 0.35, 0.70, 1.00}; 
		size = 16; 
		importance = "2 * 16 * 0.05"; 
		coefMin = 0.25; 
		coefMax = 4.00; 
	}; 
	class Fuelstation { 
		icon = "\ca\ui\data\map_fuelstation_ca.paa"; 
		color[] = {1.00, 0.35, 0.35, 1.00}; 
		size = 16; 
		importance = "2 * 16 * 0.05"; 
		coefMin = 0.75; 
		coefMax = 4.00; 
	}; 
	class Fountain { 
		icon = "\ca\ui\data\map_fountain_ca.paa"; 
		color[] = {0.00, 0.35, 0.70, 1.00}; 
		size = 12; 
		importance = "1 * 12 * 0.05"; 
		coefMin = 0.25; 
		coefMax = 4.00; 
	}; 	
	class Hospital { 
		icon = "\ca\ui\data\map_hospital_ca.paa"; 
		color[] = {0.78, 0.00, 0.05, 1.00}; 
		size = 16; 
		importance = "2 * 16 * 0.05"; 
		coefMin = 0.50; 
		coefMax = 4; 
	}; 
	class Lighthouse { 
		icon = "\ca\ui\data\map_lighthouse_ca.paa"; 
		color[] = {0.78, 0.00, 0.05, 1.00}; 
		size = 20; 
		importance = "3 * 16 * 0.05"; 
		coefMin = 0.90; 
		coefMax = 4.00; 
	}; 
	class Quay { 
		icon = "\ca\ui\data\map_quay_ca.paa"; 
		color[] = {0.00, 0.35, 0.70, 1.00}; 
		size = 16; 
		importance = "2 * 16 * 0.05"; 
		coefMin = 0.50; 
		coefMax = 4.00; 
	};
	class Rock {
		icon = "\ca\ui\data\map_rock_ca.paa";
		color[] = {0.55, 0.64, 0.43, 1};
		size = 12;
		importance = 0.5 * 12 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
	};
	class Ruin {
		icon = "\ca\ui\data\map_ruin_ca.paa";
		color[] = {0.78, 0, 0.05, 1};
		size = 16;
		importance = 1.2 * 16 * 0.05;
		coefMin = 1;
		coefMax = 4;
	};
	class Stack { 
		icon = "\ca\ui\data\map_stack_ca.paa"; 
		color[] = {0.00, 0.35, 0.70, 1.00}; 
		size = 20; 
		importance = "2 * 16 * 0.05"; 
		coefMin = 0.90; 
		coefMax = 4.00; 
	}; 
	class Tree { 
		icon = "\ca\ui\data\map_tree_ca.paa"; 
		color[] = {0.55, 0.64, 0.43, 1.00}; 
		size = 12; 
		importance = "0.9 * 16 * 0.05"; 
		coefMin = 0.25; 
		coefMax = 4.00; 
	}; 
	class SmallTree { 
		icon = "\ca\ui\data\map_smalltree_ca.paa"; 
		color[] = {0.55, 0.64, 0.43, 1.00}; 
		size = 12; 
		importance = "0.6 * 12 * 0.05"; 
		coefMin = 0.25; 
		coefMax = 4.00; 
	}; 
	class Task {
		icon = "";
		color[] = {0.55, 0.64, 0.43, 1};
		size = 16;
		importance = 0.7 * 16 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
		iconCreated = "#(argb,8,8,3)color(1,1,1,1)";
		iconCanceled = "#(argb,8,8,3)color(0,0,1,1)";
		iconDone = "#(argb,8,8,3)color(0,0,0,1)";
		iconFailed = "#(argb,8,8,3)color(1,0,0,1)";
		colorCreated[] = {1,1,1,1};
		colorCanceled[] = {1,1,1,1};
		colorDone[] = {1,1,1,1};
		colorFailed[] = {1,1,1,1};
	};	
	class Tourism { 
		icon = "\ca\ui\data\map_tourism_ca.paa"; 
		color[] = {0.78, 0.00, 0.05, 1.00}; 
		size = 16; importance = "1 * 16 * 0.05"; 
		coefMin = 0.70; 
		coefMax = 4.00; 
	}; 
	class Transmitter { 
		icon = "\ca\ui\data\map_transmitter_ca.paa"; 
		color[] = {0.00, 0.35, 0.70, 1.00}; 
		size = 20; 
		importance = "2 * 16 * 0.05"; 
		coefMin = 0.90; 
		coefMax = 4.00; 
	}; 
	class ViewTower { 
		icon = "\ca\ui\data\map_viewtower_ca.paa"; 
		color[] = {0.00, 0.35, 0.70, 1.00}; 
		size = 16; 
		importance = "2.5 * 16 * 0.05"; 
		coefMin = 0.50; 
		coefMax = 4.00; 
	}; 
	class Watertower { 
		icon = "\ca\ui\data\map_watertower_ca.paa"; 
		color[] = {0.00, 0.35, 0.70, 1.00}; 
		size = 32; 
		importance = "1.2 * 16 * 0.05"; 
		coefMin = 0.90; 
		coefMax = 4.00;
	}; 
	class Waypoint { 
		icon = "\ca\ui\data\map_waypoint_ca.paa"; 
		color[] = {0.00, 0.00, 0.00, 1.00}; 
		size = 24; 
		importance = 1.00; 
		coefMin = 1.00; 
		coefMax = 1.00; 
	}; 
	class WaypointCompleted { 
		icon = "\ca\ui\data\map_waypoint_completed_ca.paa"; 
		color[] = {0.00, 0.00, 0.00, 1.00}; 
		size = 24; 
		importance = 1.00; 
		coefMin = 1.00; 
		coefMax = 1.00; 
	}; 
};

class MyRscButton {
	idc = -1;
	type = CT_BUTTON; 
	style = ST_CENTER;
	default = false; 
	font = "PuristaBold"; 
	text = "";
	action = "";
	sizeEx = 0.025; 
	//colorText[] = {0.87, 0.84, 0.65, 1}; //default OA color
	colorText[] = {0.9, 0.9, 0.9, 1};
	colorFocused[] = {0.3,0.3,0.3,0.8};  // border color for when selected
	colorDisabled[] = {0, 0, 0, 0}; // text color for disabled state 
	colorBackground[] = {0.3,0.3,0.3,0.8}; 
	colorBackgroundDisabled[] = {0.05, 0.05, 0.05, 0.5}; // background color for disabled state 
	colorBackgroundActive[] = {0.2, 0.2, 0.2, 0.95};  // background color when over with mouse
	w = 0.1525;
	h = 0.0525;
	offsetX = 0.003; 
	offsetY = 0.0035; 
	offsetPressedX = 0.000; 
	offsetPressedY = 0.000; 
	shadow = 0;
	colorShadow[] = { 0, 0, 0, 0.5}; 
	colorBorder[] = { 0, 0, 0, 0}; 
	borderSize = 0; 
	soundEnter[] = { "", 0, 1 }; // no sound 
	soundPush[] = { "", 0, 1 }; 
	soundClick[] = { "", 0, 1 }; // no sound 
	soundEscape[] = { "", 0, 1 }; // no sound 
};

class MyRscCombo {
	access = 0;
	type = CT_COMBO;
	style = ST_LEFT;
	h = 0.05;
	wholeHeight = 0.5;
	colorSelect[] = {0.6,0.6,0.6,1};
	colorText[] = {1,1,1,1};
	colorBackground[] = {0.2,0.2,0.2,1};
	colorScrollbar[] = {1,1,1,1};
	colorDisabled[] = {1, 1, 1, 0.3};
	font = "PuristaBold";
	arrowEmpty = "\ca\ui\data\ui_arrow_combo_ca.paa";
	arrowFull = "\ca\ui\data\ui_arrow_combo_active_ca.paa";
	sizeEx = 0.028;
	soundSelect[] = {"",0.1,1};
	soundExpand[] = {"",0.1,1};
	soundCollapse[] = {"",0.1,1};
	maxHistoryDelay = 1.0;
	shadow = 0;
	
	class ScrollBar {
		color[] = {1, 1, 1, 0.6};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.3};
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
		border = "\ca\ui\data\ui_border_scroll_ca.paa";
	};
};

class A3RscCombo {
	access = 0; // Control access (0 - ReadAndWrite, 1 - ReadAndCreate, 2 - ReadOnly, 3 - ReadOnlyVerified)
	idc = -1; // Control identification (without it, the control won't be displayed)
	type = CT_COMBO; // Type is 4
	style = ST_LEFT; // Style
	default = 0; // Control selected by default (only one within a display can be used)
	blinkingPeriod = 0; // Time in which control will fade out and back in. Use 0 to disable the effect.

	x = 1; // Horizontal coordinates
	y = 1; // Vertical coordinates
	w = 1; // Width
	h = 1; // Height

	colorBackground[] = {0.2,0.2,0.2,1}; // Fill color
	colorSelectBackground[] = {1,0.5,0,1}; // Selected item fill color

	sizeEx = 0.035; // Text size
	font = "PuristaBold"; // Font from CfgFontFamilies
	shadow = 0; // Shadow (0 - none, 1 - N/A, 2 - black outline)
	colorText[] = {1,1,1,1}; // Text and frame color
	colorDisabled[] = {1,1,1,0.5}; // Disabled text color
	colorSelect[] = {1,1,1,1}; // Text selection color

	pictureColor[] = {1,0.5,0,1}; // Picture color
	pictureColorSelect[] = {1,1,1,1}; // Selected picture color
	pictureColorDisabled[] = {1,1,1,0.5}; // Disabled picture color

	//tooltip = "CT_COMBO"; // Tooltip text
	tooltipColorShade[] = {0,0,0,1}; // Tooltip background color
	tooltipColorText[] = {1,1,1,1}; // Tooltip text color
	tooltipColorBox[] = {1,1,1,1}; // Tooltip frame color

	arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa"; // Expand arrow
	arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa"; // Collapse arrow

	wholeHeight = 0.8; // Maximum height of expanded box (including the control height)
	maxHistoryDelay = 1; // Time since last keyboard type search to reset it

	soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1}; // Sound played when the list is expanded
	soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1}; // Sound played when the list is collapsed
	soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1}; // Sound played when an item is selected

	// Scrollbar configuration (applied only when LB_TEXTURES style is used)
	class ComboScrollBar
	{
		width = 0; // width of ComboScrollBar
		height = 0; // height of ComboScrollBar
		scrollSpeed = 0.01; // scrollSpeed of ComboScrollBar

		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa"; // Arrow
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa"; // Arrow when clicked on
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa"; // Slider background (stretched vertically)
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa"; // Dragging element (stretched vertically)
		color[] = {1,1,1,1}; // Scrollbar color
	};

	//onCanDestroy = "systemChat str ['onCanDestroy',_this]; true";
	//onDestroy = "systemChat str ['onDestroy',_this]; false";
	//onSetFocus = "systemChat str ['onSetFocus',_this]; false";
	//onKillFocus = "systemChat str ['onKillFocus',_this]; false";
	//onKeyDown = "systemChat str ['onKeyDown',_this]; false";
	//onKeyUp = "systemChat str ['onKeyUp',_this]; false";
	//onMouseButtonDown = "systemChat str ['onMouseButtonDown',_this]; false";
	//onMouseButtonUp = "systemChat str ['onMouseButtonUp',_this]; false";
	//onMouseButtonClick = "systemChat str ['onMouseButtonClick',_this]; false";
	//onMouseButtonDblClick = "systemChat str ['onMouseButtonDblClick',_this]; false";
	//onMouseZChanged = "systemChat str ['onMouseZChanged',_this]; false";
	//onMouseMoving = "";
	//onMouseHolding = "";

	//onLBSelChanged = "systemChat str ['onLBSelChanged',_this]; false";
};

class MyRscSlider {
    idc = -1; 
    type = CT_SLIDER; 
    style = SL_HORZ; 
    x = 0.4; 
    y = 0.2; 
    w = 0.3; 
    h = 0.025; 
    color[] = {1, 1, 1, 1}; 
    coloractive[] = {1, 0, 0, 0.8};
    // This is an ctrlEventHandler to show you some response if you move the sliderpointer.
    onSliderPosChanged = "";
};

#define darkBrown {(170/255),(110/255),(30/255),0.5}
#define lightBrown {(200/255),(165/255),(60/255),0.5}

#define column 0.1
#define row 0.36
#define button_w 0.165
#define button_h 0.045
#define space_w 0.0065
#define space_h 0.00825

class nf_vehicleSpawn_tool {
	idd = 67800;
		
	class controlsBackground {	
		/// MAIN BACKGROUNG ///
		class background : MyRscBox {
			idc = -1;
			colorBackground[] = {0.2,0.2,0.2,0.6};
			//colorBackground[] = {0, 0, 0, 0.6};
			x = column;
			y = row;
			w = button_w*4 + space_w*5;
			h = button_h*6 + space_h*8;
		};
	};
	
	class controls {
		/// MAIN PAGE ///
		class main_button_0 : MyRscCombo {
			idc = 1000;
			x = column + space_w;
			y = row + space_h;
			w = button_w*2 + space_w;
			h = button_h;
		};
		
		class main_button_1 : MyRscButton {
			idc = 1100;
			colorBackground[] = {0.3,0.3,0.3,1};
			x = column + button_w*2 + space_w*3;
			y = row + space_h;
			w = button_w;
			h = button_h;
			sizeEx = 0.03;
			text = "Spawn";
		};
		
		class main_button_2 : main_button_1 {
			idc = 1200;
			w = button_w;
			x = column + button_w*3 + space_w*4;
			y = row + button_h*5 + space_h*7;
			text = "Cancel";
			action = "closeDialog 0;";
		};
		
		class main_button_3 : MyRscPicture {
			idc = 1300;
			x = column + button_w*1.25 + button_w*1.75;
			y = row + space_h;
			w = button_w*1;
			h = button_h*5;
			text = "";
		};
		
		class main_button_4 : main_button_1 {
			idc = 1400;
			w = button_w;
			x = column + button_w*2 + space_w*3;
			y = row + button_h*5 + space_h*7;
			text = "Clear";
			action = "null = [0,0,0,[0,0,var_currentSpawnPos,var_currentSpawnRange]] execVM 'init\local\nf_spawnInterface\nf_si_clearSpawn.sqf';";
		};
	};
};

#define e_button_h 0.05
#define e_button_w 0.2
#define icon_h (safezoneH / 25)
#define icon_w (icon_h * 0.8)
class nf_editor_interface {
	idd = 20000;

	class controls {
		class main_combo : A3RscCombo {
			idc = 21000;
			x = 0.6;
			y = 0.35;
			w = 0.5;
			h = 0.05;
		};
		
		class category_combo : main_combo {
			idc = 21001;
			x = 0.28;
			w = 0.3;
		};
		
		class button_1 : MyRscButton {
			idc = 22000;
			x = 0.5 - e_button_w/2;
			y = 0.5 - e_button_h*3;
			w = e_button_w;
			h = e_button_h;
			sizeEx = 0.03; 
			text = "Move";
		};
		
		class button_2 : button_1 {
			idc = 23000;
			y = 0.5 + e_button_h*2;
			text = "Remove";
		};
		
		class button_3 : button_1 {
			idc = 24000;
			x = 0.5 + e_button_w/2;
			y = 0.5 - e_button_h/2;
			text = "Copy";
		};
		
		class button_4 : button_1 {
			idc = 25000;
			x = 0.5 - e_button_w*1.5;
			y = 0.5 - e_button_h/2;
			text = "Functions";
		};
		
		class button_5 : button_1 {
			idc = 26000;
			x = safeZoneX;
			y = safeZoneY + safezoneH - icon_h;
			w = icon_w;
			h = icon_h;
			text = "";
			colorFocused[] = {0.3,0.3,0.3,0};  // border color for when selected
			colorDisabled[] = {0, 0, 0, 0}; // text color for disabled state 
			colorBackground[] = {0.3,0.3,0.3,0}; 
			colorBackgroundDisabled[] = {0.05, 0.05, 0.05, 0}; // background color for disabled state 
			colorBackgroundActive[] = {0.2, 0.2, 0.2, 0};  // background color when over with mouse
			colorShadow[] = { 0, 0, 0, 0}; 
		};
		
		class button_6 : button_5 {
			idc = 26001;
			x = safeZoneX + icon_w;
		};
		
		class button_7 : button_5 {
			idc = 26002;
			x = safeZoneX + icon_w*2;
		};
		
		class button_8 : button_5 {
			idc = 26003;
			x = safeZoneX + icon_w*3;
		};
		
		class button_exit : button_1 {
			idc = -1;
			x = safezoneX + safezoneW - e_button_w/2;
			y = safezoneY;
			w = e_button_w/2;
			sizeEx = 0.04;
			text = "Exit";
			action = "var_be_inEditor = false; closeDialog 0; false";
		};
		
		class button_save : button_exit {
			x = safezoneX + safezoneW - e_button_w*1.1;
			text = "Save";
			action = "copyToClipboard str(call e_fnc_getHistory); false";
		};
	};
};

class nf_fog_editor {
	idd = 70000;
	
	class controlsBackground {	
		class background : MyRscBox {
			idc = -1;
			colorBackground[] = {0,0,0,0.3};
			x = 0;
			y = 0.65;
			w = 1;
			h = 0.35;
		};
	};
	
	class controls {
		class slider_1 : MyRscSlider {
			idc = 70001;
			x = 0.05;
			y = 0.7;
			w = 0.9;
			h = 0.05;
			onSliderPosChanged = "[0,_this] call nf_fnc_fogSlider";
		};
		
		class slider_2 : slider_1 {
			idc = 70002;
			y = 0.8;
			onSliderPosChanged = "[1,_this] call nf_fnc_fogSlider";
		};
		
		class slider_3 : slider_1 {
			idc = 70003;
			y = 0.9;
			onSliderPosChanged = "[2,_this] call nf_fnc_fogSlider";
		};
		
		class button_1 : MyRscButton {
			idc = -1;
			x = 1 - (e_button_w/2);
			y = 0.58;
			w = e_button_w/2;
			h = e_button_h;
			sizeEx = 0.03; 
			text = "Salva";
			action = "copyToClipboard str(var_fogSettings); hintSilent 'Salvato';";
		};
		
		class button_2 : button_1 {
			x = 1 - e_button_w - space_w*2;
			text = "Reset";
			action = "call nf_fnc_sliderReset;";
		};
	};
};

#define text_h (safezoneH / 60)
#define quote_h 0.04
#define img_w 0.03
#define img_h 0.035

class RscTitles {
	class tf_hud {
		idd = 20000;
		movingEnable = 0;
		name = "tf_hud";
		duration = 1e+011;
		onLoad = "var_tf_hudIDD = [(_this select 0)]";
		
		class controls {
			class text_1 : MyRscBox {
				idc = -1;
				font = "PuristaBold";
				sizeEx = text_h;
				style = ST_RIGHT;
				x = safezoneX;
				y = safezoneY + safezoneH - text_h*2;
				w = safezoneW - img_w;
				h = text_h;
				colorText[] = {0.9, 0.9, 0.9, 0.5};
				text = "CO@24 - Framework A3";
			};
			
			class text_2 : text_1 {
				text = "=]NF[= Nera Folgore";
				y = safezoneY + safezoneH - text_h*1 - 0.005;
			};
		};
	};
	
	class nf_editor_hud {
		idd = 30000;
		movingEnable = 0;
		name = "nf_editor_hud";
		duration = 1e+011;
		onLoad = "var_be_hudIDD = [(_this select 0)]";
		
		class controls {
			class help : MyRscStructuredText {
				idc = 32000;
				colorBackground[] = {0,0,0,0};
				sizeEx = 0.028;
				x = safezoneX + 0.01;
				y = safezoneY + 0.01;
				w = 1;
				h = 1;
				text = "";
			};
			
			class text1 : help {
				idc = 31000;
				x = 0.5;
				y = 0.5;
				w = 0.5;
			};
			
			/*class tips : help {
				idc = 33000;
				colorBackground[] = {0.5,0.5,0.5,0.5};
				x = safeZoneX + safeZoneW - 0.4;
				y = safezoneY + 0.1;
				w = 0.4;
				h = 0.125;
			};*/
			
			class build : MyRscBox {
				idc = -1;
				font = "PuristaBold";
				sizeEx = text_h;
				style = ST_RIGHT;
				x = safezoneX;
				y = safezoneY + safezoneH - text_h;
				w = safezoneW;
				h = text_h;
				colorText[] = {0.9, 0.9, 0.9, 0.5};
				text = "Build Editor - =]NF[= Blackbut";
			};
			
			class grid : build {
				idc = 34000;
				sizeEx = icon_h;
				style = ST_CENTER;
				y = safezoneY + safezoneH - icon_h;
				w = icon_w;
				h = icon_h;
				colorText[] = {0.9, 0.9, 0.9, 0.4};
				text = "G";
			};
			
			class rotation : grid {
				idc = 34001;
				x = safezoneX + icon_w;
				text = "R";
			};
			
			class terrain : grid {
				idc = 34002;
				x = safezoneX + icon_w*2;
				text = "T";
			};
			
			class info : grid {
				idc = 34003;
				x = safezoneX + icon_w*3;
				text = "I";
			};
		};
	};
	
	#define hud_title_y 0.8
	#define hud_title_h 0.04
	
	class nf_titleHUD {
		idd = 60000;
		duration = 1e+011;
		onLoad = "var_title_hudIDD = [(_this select 0)]";
		
		class controlsBackground {	
			class Background : MyRscBox {
				idc = -1;
				//colorBackground[] = {0.15, 0.20, 0.15, 0.9};
				colorBackground[] = {0, 0, 0, 0};
				x = safeZoneX ;
				y = safeZoneY;
				w = safeZoneW;
				h = safeZoneH;
			};
		};
	
		class controls {
			class textPlain_1 : MyRscBox {
				idc = 61000;
				colorText[] = {0.9, 0.9, 0.9, 0.8};
				style = ST_RIGHT;
				font = "PuristaSemiBold";
				sizeEx = (hud_title_h + 0.005);
				shadow = 0;
				x = safeZoneX;
				y = hud_title_y;
				w = safeZoneW - 0.02;
				h = 0.05;
			};
		
			class textPlain_2 : textPlain_1 {
				idc = 62000;
				y = hud_title_y + hud_title_h;
			};
			
			class textPlain_3 : textPlain_1 {
				idc = 63000;
				y = hud_title_y + hud_title_h*2;
			};
			
			class textPlain_4 : textPlain_1 {
				idc = 64000;
				y = hud_title_y + hud_title_h*3;
			};
			
			class textPlain_5 : textPlain_1 {
				idc = 65000;
				y = hud_title_y + hud_title_h*4;
			};
		};
	};
};