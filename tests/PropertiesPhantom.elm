module PropertiesPhantom exposing (all)

import Css exposing (..)
import Css.Preprocess exposing (stylesheet, toPropertyStrings)
import Expect
import Test exposing (..)
import TestUtil exposing (prettyPrint)


all : Test
all =
    Test.concat
        [ testProperty { functionName = "boxSizing", property = "box-sizing" }
            [ ( boxSizing initial, "initial" )
            , ( boxSizing unset, "unset" )
            , ( boxSizing inherit, "inherit" )
            , ( boxSizing contentBox, "content-box" )
            , ( boxSizing borderBox, "border-box" )
            ]
        , testProperty { functionName = "borderStyle", property = "border-style" }
            [ ( borderStyle initial, "initial" )
            , ( borderStyle unset, "unset" )
            , ( borderStyle inherit, "inherit" )
            , ( borderStyle none, "none" )
            , ( borderStyle solid, "solid" )
            , ( borderStyle dotted, "dotted" )
            , ( borderStyle dashed, "dashed" )
            , ( borderStyle hidden, "hidden" )
            , ( borderStyle double, "double" )
            ]
        , testProperty { functionName = "borderWidth", property = "border-width" }
            [ ( borderWidth initial, "initial" )
            , ( borderWidth unset, "unset" )
            , ( borderWidth inherit, "inherit" )

            -- , ( borderWidth (pct 90), "90%" )
            , ( borderWidth (em 4), "4em" )
            , ( borderWidth2 (em 4) (px 2), "4em 2px" )

            -- , ( borderWidth3 (em 4) (px 2) (pct 5), "4em 2px 5%" )
            -- , ( borderWidth4 (em 4) (px 2) (pct 5) (px 3), "4em 2px 5% 3px" )
            ]
        , testProperty { functionName = "width", property = "width" }
            [--  ( width initial, "initial" )
             -- , ( width unset, "unset" )
             -- , ( width inherit, "inherit" )
             -- , ( width auto, "auto" )
             -- , ( width (pct 90), "90%" )
            ]
        , testProperty { functionName = "minWidth", property = "min-width" }
            [--  ( minWidth initial, "initial" )
             -- , ( minWidth unset, "unset" )
             -- , ( minWidth inherit, "inherit" )
             -- , ( minWidth maxContent, "max-content" )
             -- , ( minWidth minContent, "min-content" )
             -- , ( minWidth fitContent, "fit-content" )
             -- , ( minWidth fillAvailable, "fill-available" )
             -- , ( minWidth (pc 9), "9pc" )
            ]
        , testProperty { functionName = "maxWidth", property = "max-width" }
            [--  ( maxWidth initial, "initial" )
             -- , ( maxWidth unset, "unset" )
             -- , ( maxWidth inherit, "inherit" )
             -- , ( maxWidth none, "none" )
             -- , ( maxWidth maxContent, "max-content" )
             -- , ( maxWidth minContent, "min-content" )
             -- , ( maxWidth fitContent, "fit-content" )
             -- , ( maxWidth fillAvailable, "fill-available" )
             -- , ( maxWidth (cm 17), "17cm" )
            ]
        , testProperty { functionName = "height", property = "height" }
            [--  ( height initial, "initial" )
             -- , ( height unset, "unset" )
             -- , ( height inherit, "inherit" )
             -- , ( height auto, "auto" )
             -- , ( height (mm 8), "8mm" )
            ]
        , testProperty { functionName = "minHeight", property = "min-height" }
            [--  ( minHeight initial, "initial" )
             -- , ( minHeight unset, "unset" )
             -- , ( minHeight inherit, "inherit" )
             -- , ( minHeight maxContent, "max-content" )
             -- , ( minHeight minContent, "min-content" )
             -- , ( minHeight fitContent, "fit-content" )
             -- , ( minHeight fillAvailable, "fill-available" )
             -- , ( minHeight (pc 9), "9pc" )
            ]
        , testProperty { functionName = "maxHeight", property = "max-height" }
            [--  ( maxHeight initial, "initial" )
             -- , ( maxHeight unset, "unset" )
             -- , ( maxHeight inherit, "inherit" )
             -- , ( maxHeight none, "none" )
             -- , ( maxHeight maxContent, "max-content" )
             -- , ( maxHeight minContent, "min-content" )
             -- , ( maxHeight fitContent, "fit-content" )
             -- , ( maxHeight fillAvailable, "fill-available" )
             -- , ( maxHeight (cm 17), "17cm" )
            ]
        , testProperty { functionName = "textIndent", property = "text-indent" }
            [--  ( textIndent initial, "initial" )
             -- , ( textIndent unset, "unset" )
             -- , ( textIndent inherit, "inherit" )
             -- , ( textIndent (px 5), "5px" )
             -- , ( textIndent2 initial initial, "initial initial" )
             -- , ( textIndent2 unset unset, "unset unset" )
             -- , ( textIndent2 inherit inherit, "inherit inherit" )
             -- , ( textIndent2 (em 3) hanging, "3em hanging" )
             -- , ( textIndent2 (pc 2) eachLine, "2pc each-line" )
            ]
        , testProperty { functionName = "textDecoration", property = "text-decoration" }
            [ ( textDecoration initial, "initial" )
            , ( textDecoration unset, "unset" )
            , ( textDecoration inherit, "inherit" )
            , ( textDecoration none, "none" )
            , ( textDecoration underline, "underline" )
            , ( textDecoration overline, "overline" )
            , ( textDecoration lineThrough, "line-through" )
            ]
        , testProperty { functionName = "textDecoration2", property = "text-decoration" }
            [ {- ( textDecoration2 initial wavy, "initial wavy" )
                 , ( textDecoration2 unset dotted, "unset dotted" )
                 , ( textDecoration2 inherit dashed, "inherit dashed" )
                 ,
              -}
              ( textDecoration2 none solid, "none solid" )
            , ( textDecoration2 underline double, "underline double" )

            -- , ( textDecoration2 overline initial, "overline initial" )
            -- , ( textDecoration2 lineThrough unset, "line-through unset" )
            -- , ( textDecoration2 lineThrough inherit, "line-through inherit" )
            ]
        , testProperty { functionName = "textDecoration3", property = "text-decoration" }
            [ {- ( textDecoration3 initial wavy (rgb 11 12 13), "initial wavy rgb(11,12,13)" )
                 , ( textDecoration3 unset dotted (rgb 11 12 13), "unset dotted rgb(11,12,13)" )
                 , ( textDecoration3 inherit dashed (rgb 11 12 13), "inherit dashed rgb(11,12,13)" )
                 ,
              -}
              ( textDecoration3 none solid (rgb 11 12 13), "none solid rgb(11,12,13)" )
            , ( textDecoration3 underline double (hex "aabbcc"), "underline double #aabbcc" )

            -- , ( textDecoration3 overline initial (hex "aabbcc"), "overline initial #aabbcc" )
            -- , ( textDecoration3 lineThrough unset (hex "#bbccdd"), "line-through unset #bbccdd" )
            -- , ( textDecoration3 lineThrough inherit (hex "bbccdd05"), "line-through inherit #bbccdd05" )
            ]
        , testProperty { functionName = "textDecorations []", property = "text-decoration" }
            [-- ( textDecorations [], "none" )
            ]
        , testProperty { functionName = "textDecorations", property = "text-decoration" }
            [--  ( textDecorations [ initial ], "initial" )
             -- , ( textDecorations [ unset, inherit ], "unset inherit" )
             -- , ( textDecorations [ none ], "none" )
             -- , ( textDecorations [ underline, overline, lineThrough ], "underline overline line-through" )
            ]
        , testProperty { functionName = "textDecorations2", property = "text-decoration" }
            [--  ( textDecorations2 [] double, "none double" )
             -- , ( textDecorations2 [ initial ] solid, "initial solid" )
             -- , ( textDecorations2 [ unset, inherit ] dashed, "unset inherit dashed" )
             -- , ( textDecorations2 [ none ] dotted, "none dotted" )
             -- , ( textDecorations2 [ underline, overline, lineThrough ] wavy, "underline overline line-through wavy" )
             -- , ( textDecorations2 [ underline, overline, lineThrough ] initial, "underline overline line-through initial" )
             -- , ( textDecorations2 [ underline, overline, lineThrough ] unset, "underline overline line-through unset" )
             -- , ( textDecorations2 [ underline, overline, lineThrough ] inherit, "underline overline line-through inherit" )
            ]
        , testProperty { functionName = "textDecorations3", property = "text-decoration" }
            [--  ( textDecorations3 [] double (rgb 11 12 13), "none double rgb(11,12,13)" )
             -- , ( textDecorations3 [ initial ] solid (rgb 11 12 13), "initial solid rgb(11,12,13)" )
             -- , ( textDecorations3 [ unset, inherit ] dashed (rgb 11 12 13), "unset inherit dashed rgb(11,12,13)" )
             -- , ( textDecorations3 [ none ] dotted (rgb 11 12 13), "none dotted rgb(11,12,13)" )
             -- , ( textDecorations3 [ underline, overline, lineThrough ] wavy (rgb 11 12 13), "underline overline line-through wavy rgb(11,12,13)" )
             -- , ( textDecorations3 [ underline, overline, lineThrough ] initial (rgb 11 12 13), "underline overline line-through initial rgb(11,12,13)" )
             -- , ( textDecorations3 [ underline, overline, lineThrough ] unset (rgb 11 12 13), "underline overline line-through unset rgb(11,12,13)" )
             -- , ( textDecorations3 [ underline, overline, lineThrough ] inherit (rgb 11 12 13), "underline overline line-through inherit rgb(11,12,13)" )
            ]
        , testProperty { functionName = "textDecorationLine", property = "text-decoration-line" }
            [ ( textDecorationLine initial, "initial" )
            , ( textDecorationLine unset, "unset" )
            , ( textDecorationLine inherit, "inherit" )
            , ( textDecorationLine none, "none" )
            , ( textDecorationLine underline, "underline" )
            , ( textDecorationLine overline, "overline" )
            , ( textDecorationLine lineThrough, "line-through" )
            ]
        , testProperty { functionName = "textDecorationLines []", property = "text-decoration-line" }
            [-- ( textDecorationLines [], "none" )
            ]
        , testProperty { functionName = "textDecorationLines", property = "text-decoration-line" }
            [--  ( textDecorationLines [ initial ], "initial" )
             -- , ( textDecorationLines [ unset, inherit ], "unset inherit" )
             -- , ( textDecorationLines [ none ], "none" )
             -- , ( textDecorationLines [ underline, overline, lineThrough ], "underline overline line-through" )
            ]
        , testProperty { functionName = "textTransform", property = "text-transform" }
            [ ( textTransform capitalize, "capitalize" )
            , ( textTransform uppercase, "uppercase" )
            , ( textTransform lowercase, "lowercase" )
            , ( textTransform none, "none" )
            , ( textTransform fullWidth, "full-width" )
            , ( textTransform inherit, "inherit" )
            , ( textTransform initial, "initial" )
            , ( textTransform unset, "unset" )
            ]
        , testProperty { functionName = "lineHeight", property = "line-height" }
            [ ( lineHeight (px 1), "1px" )
            , ( lineHeight (pct 10), "10%" )
            , ( lineHeight (em 1.2), "1.2em" )

            -- , ( lineHeight (pt 12), "12pt" )
            , ( lineHeight (num 1.8), "1.8" )
            , ( lineHeight (num 0), "0" )

            -- , ( lineHeight (calc (px 5) plus (pct 1)), "calc(5px + 1%)" )
            -- , ( lineHeight (calc (em 5.5) minus (pt 1)), "calc(5.5em - 1pt)" )
            -- , ( lineHeight (calc (px 5) plus (calc (pct 5) plus (vh 3))), "calc(5px + (5% + 3vh))" )
            -- , ( lineHeight (calc (px 5) plus (calc (pct 5) minus (vh 3))), "calc(5px + (5% - 3vh))" )
            -- , ( lineHeight (calc (px 5) minus (calc (pct 5) plus (vh 3))), "calc(5px - (5% + 3vh))" )
            -- , ( lineHeight (calc (px 5) minus (calc (pct 5) minus (vh 3))), "calc(5px - (5% - 3vh))" )
            -- , ( lineHeight (calc (calc (pct 5) plus (vh 3)) plus (px 5)), "calc((5% + 3vh) + 5px)" )
            -- , ( lineHeight (calc (calc (pct 5) minus (vh 3)) plus (px 5)), "calc((5% - 3vh) + 5px)" )
            -- , ( lineHeight (calc (calc (pct 5) plus (vh 3)) minus (px 5)), "calc((5% + 3vh) - 5px)" )
            -- , ( lineHeight (calc (calc (pct 5) minus (vh 3)) minus (px 5)), "calc((5% - 3vh) - 5px)" )
            , ( lineHeight inherit, "inherit" )
            , ( lineHeight initial, "initial" )
            , ( lineHeight unset, "unset" )
            ]
        , testProperty { functionName = "overflowX", property = "overflow-x" }
            [ ( overflowX initial, "initial" )
            , ( overflowX unset, "unset" )
            , ( overflowX inherit, "inherit" )
            , ( overflowX auto, "auto" )
            , ( overflowX visible, "visible" )
            , ( overflowX hidden, "hidden" )
            , ( overflowX scroll, "scroll" )
            ]
        , testProperty { functionName = "overflowY", property = "overflow-y" }
            [ ( overflowY initial, "initial" )
            , ( overflowY unset, "unset" )
            , ( overflowY inherit, "inherit" )
            , ( overflowY auto, "auto" )
            , ( overflowY visible, "visible" )
            , ( overflowY hidden, "hidden" )
            , ( overflowY scroll, "scroll" )
            ]
        , testProperty { functionName = "overflowWrap", property = "overflow-wrap" }
            [ ( overflowWrap normal, "normal" )
            ]
        , testProperty { functionName = "overflow", property = "overflow" }
            [ ( overflow initial, "initial" )
            , ( overflow unset, "unset" )
            , ( overflow inherit, "inherit" )
            , ( overflow auto, "auto" )
            , ( overflow visible, "visible" )
            , ( overflow hidden, "hidden" )
            , ( overflow scroll, "scroll" )
            ]
        , testProperty { functionName = "visibility", property = "visibility" }
            [ ( visibility visible, "visible" )
            , ( visibility hidden, "hidden" )
            , ( visibility collapse, "collapse" )
            , ( visibility initial, "initial" )
            , ( visibility inherit, "inherit" )
            , ( visibility unset, "unset" )
            ]
        , testProperty { functionName = "textRendering", property = "text-rendering" }
            [ ( textRendering initial, "initial" )
            , ( textRendering unset, "unset" )
            , ( textRendering inherit, "inherit" )
            , ( textRendering auto, "auto" )
            , ( textRendering optimizeSpeed, "optimizeSpeed" )
            , ( textRendering optimizeLegibility, "optimizeLegibility" )
            , ( textRendering geometricPrecision, "geometricPrecision" )
            ]
        , testProperty { functionName = "display", property = "display" }
            [ ( display initial, "initial" )
            , ( display unset, "unset" )
            , ( display inherit, "inherit" )
            , ( display none, "none" )
            , ( display inline, "inline" )
            , ( display block, "block" )
            , ( display inlineBlock, "inline-block" )
            , ( display inlineFlex, "inline-flex" )

            -- , ( display listItem, "list-item" )
            -- , ( display inlineListItem, "inline-list-item" )
            -- , ( display felx_, "flex" )
            , ( display table, "table" )

            -- , ( display inlineTable, "inline-table" )
            , ( display tableCell, "table-cell" )
            , ( display tableColumn, "table-column" )
            , ( display tableColumnGroup, "table-column-group" )
            , ( display tableFooterGroup, "table-footer-group" )
            , ( display tableHeaderGroup, "table-header-group" )
            , ( display tableRow, "table-row" )
            , ( display tableRowGroup, "table-row-group" )

            -- TODO display: contents;
            -- TODO display: flex;
            -- TODO display: grid;
            -- TODO display: inline-grid;
            -- TODO display: ruby;
            -- TODO display: ruby-base;
            -- TODO display: ruby-text;
            -- TODO display: ruby-base-container;
            -- TODO display: ruby-text-container ;
            -- TODO display: run-in;
            ]
        , testProperty { functionName = "pointerEvents", property = "pointer-events" }
            [ ( pointerEvents auto, "auto" )
            , ( pointerEvents none, "none" )

            -- , ( pointerEvents visiblePainted, "visiblePainted" )
            -- , ( pointerEvents visibleFill, "visibleFill" )
            -- , ( pointerEvents visibleStroke, "visibleStroke" )
            -- , ( pointerEvents visible, "visible" )
            -- , ( pointerEvents painted, "painted" )
            -- , ( pointerEventsFill, "fill" )
            -- , ( pointerEvents stroke, "stroke" )
            -- , ( pointerEventsAll, "all" )
            , ( pointerEvents inherit, "inherit" )
            , ( pointerEvents initial, "initial" )
            , ( pointerEvents unset, "unset" )
            ]
        , testProperty { functionName = "flex", property = "flex" }
            [ ( flex initial, "initial" )
            , ( flex unset, "unset" )
            , ( flex inherit, "inherit" )
            , ( flex auto, "auto" )
            , ( flex content, "content" )
            , ( flex none, "none" )

            -- , ( flex (int 2), "2" )
            , ( flex (mm 8), "8mm" )

            -- , ( flex2 (int 1) (int 2), "1 2" )
            -- , ( flex2 (int 1) (px 30), "1 30px" )
            -- , ( flex3 (int 1) (int 2) (px 20), "1 2 20px" )
            ]
        , testProperty { functionName = "flexBasis", property = "flex-basis" }
            [ ( flexBasis initial, "initial" )
            , ( flexBasis unset, "unset" )
            , ( flexBasis inherit, "inherit" )
            , ( flexBasis auto, "auto" )
            , ( flexBasis content, "content" )
            , ( flexBasis (px 10), "10px" )
            , ( flexBasis (mm 8), "8mm" )
            ]
        , testProperty { functionName = "flexWrap", property = "flex-wrap" }
            [ ( flexWrap initial, "initial" )
            , ( flexWrap unset, "unset" )
            , ( flexWrap inherit, "inherit" )
            , ( flexWrap wrap, "wrap" )
            , ( flexWrap nowrap, "nowrap" )
            , ( flexWrap wrapReverse, "wrap-reverse" )
            ]
        , testProperty { functionName = "flexGrow", property = "flex-grow" }
            [ {- ( flexGrow (int 1), "1" )
                 ,
              -}
              ( flexGrow (num 0.2), "0.2" )
            ]
        , testProperty { functionName = "flexShrink", property = "flex-shrink" }
            [ {- ( flexShrink (int 1), "1" )
                 ,
              -}
              ( flexShrink (num 0.2), "0.2" )
            ]
        , testProperty { functionName = "flexDirection", property = "flex-direction" }
            [ ( flexDirection initial, "initial" )
            , ( flexDirection unset, "unset" )
            , ( flexDirection inherit, "inherit" )
            , ( flexDirection row, "row" )
            , ( flexDirection rowReverse, "row-reverse" )
            , ( flexDirection column, "column" )
            , ( flexDirection columnReverse, "column-reverse" )
            ]
        , testProperty { functionName = "flexFlow1", property = "flex-flow" }
            [ ( flexFlow initial, "initial" )
            , ( flexFlow unset, "unset" )
            , ( flexFlow inherit, "inherit" )
            , ( flexFlow row, "row" )
            , ( flexFlow rowReverse, "row-reverse" )
            , ( flexFlow column, "column" )
            , ( flexFlow columnReverse, "column-reverse" )
            , ( flexFlow nowrap, "nowrap" )
            , ( flexFlow wrap, "wrap" )
            , ( flexFlow wrapReverse, "wrap-reverse" )
            , ( flexFlow2 row wrap, "row wrap" )
            , ( flexFlow2 row nowrap, "row nowrap" )
            , ( flexFlow2 row wrapReverse, "row wrap-reverse" )
            , ( flexFlow2 rowReverse wrap, "row-reverse wrap" )
            , ( flexFlow2 rowReverse nowrap, "row-reverse nowrap" )
            , ( flexFlow2 rowReverse wrapReverse, "row-reverse wrap-reverse" )
            , ( flexFlow2 column wrap, "column wrap" )
            , ( flexFlow2 column nowrap, "column nowrap" )
            , ( flexFlow2 column wrapReverse, "column wrap-reverse" )
            , ( flexFlow2 columnReverse wrap, "column-reverse wrap" )
            , ( flexFlow2 columnReverse nowrap, "column-reverse nowrap" )
            , ( flexFlow2 columnReverse wrapReverse, "column-reverse wrap-reverse" )
            ]
        , testProperty { functionName = "order", property = "order" }
            [-- ( order (int 1), "1" )
            ]
        , testProperty { functionName = "fontWeight", property = "font-weight" }
            [ ( fontWeight bold, "bold" )
            , ( fontWeight normal, "normal" )

            -- , ( fontWeight (int 100), "100" )
            -- , ( fontWeight (int 200), "200" )
            -- , ( fontWeight (int 300), "300" )
            -- , ( fontWeight (int 400), "400" )
            -- , ( fontWeight (int 500), "500" )
            -- , ( fontWeight (int 600), "600" )
            -- , ( fontWeight (int 700), "700" )
            -- , ( fontWeight (int 800), "800" )
            -- , ( fontWeight (int 900), "900" )
            ]
        , testProperty { functionName = "fontStyle", property = "font-style" }
            [ ( fontStyle normal, "normal" )
            ]
        , testProperty { functionName = "fontFeatureSettings", property = "font-feature-settings" }
            [--  ( fontFeatureSettings (featureTag "smcp"), "\"smcp\" 1" )
             -- , ( fontFeatureSettings (featureTag2 "liga" 0), "\"liga\" 0" )
             -- , ( fontFeatureSettingsList [ featureTag2 "liga" 0, featureTag2 "swsh" 2 ], "\"liga\" 0, \"swsh\" 2" )
             -- , ( fontFeatureSettings normal, "normal" )
            ]
        , testProperty { functionName = "alignItems", property = "align-items" }
            [ ( alignItems flexStart, "flex-start" )
            , ( alignItems flexEnd, "flex-end" )
            , ( alignItems center, "center" )
            , ( alignItems baseline, "baseline" )
            , ( alignItems stretch, "stretch" )
            ]
        , testProperty { functionName = "alignSelf", property = "align-self" }
            [ ( alignSelf flexStart, "flex-start" )
            , ( alignSelf flexEnd, "flex-end" )
            , ( alignSelf center, "center" )
            , ( alignSelf baseline, "baseline" )
            , ( alignSelf stretch, "stretch" )
            ]
        , testProperty { functionName = "justifyContent", property = "justify-content" }
            [ ( justifyContent flexStart, "flex-start" )
            , ( justifyContent flexEnd, "flex-end" )
            , ( justifyContent center, "center" )
            , ( justifyContent spaceAround, "space-around" )
            , ( justifyContent spaceBetween, "space-between" )
            , ( justifyContent spaceEvenly, "space-evenly" )
            ]

        -- , testProperty { functionName = "opacity", property = "opacity" }
        --     [ ( opacity inherit, "inherit" )
        --     , ( opacity (int 1), "1" )
        --     , ( opacity (pct 23.4), "23.4%" )
        --     , ( opacity (num 0.2), "0.2" )
        --     , ( opacity zero, "0" )
        --     , ( opacity unset, "unset" )
        --     , ( opacity initial, "initial" )
        --     ]
        , testOneValuedProperty { function = opacity, functionName = "opacity", property = "opacity" }
            [ ( num 0.2, "0.2" )
            , ( zero, "0" )
            ]
        , testProperty { functionName = "color", property = "color" }
            [ ( color (hsl 120 0.5 0.5), "hsl(120,50%,50%)" )
            , ( color (hsla 120 0.5 0.5 0.5), "hsla(120,50%,50%,0.5)" )
            , ( color inherit, "inherit" )
            , ( color unset, "unset" )
            , ( color initial, "initial" )
            ]
        , testProperty { functionName = "cursor", property = "cursor" }
            [ ( cursor pointer, "pointer" )
            , ( cursor crosshair, "crosshair" )
            , ( cursor contextMenu, "context-menu" )
            , ( cursor help, "help" )
            , ( cursor Css.progress, "progress" )
            , ( cursor wait, "wait" )
            , ( cursor cell, "cell" )

            -- , ( cursor text_, "text" )
            , ( cursor verticalText, "vertical-text" )

            -- , ( cursor cursorAlias, "alias" )
            , ( cursor copy, "copy" )
            , ( cursor move, "move" )
            , ( cursor noDrop, "no-drop" )
            , ( cursor notAllowed, "not-allowed" )
            , ( cursor eResize, "e-resize" )
            , ( cursor nResize, "n-resize" )
            , ( cursor neResize, "ne-resize" )
            , ( cursor nwResize, "nw-resize" )
            , ( cursor sResize, "s-resize" )
            , ( cursor seResize, "se-resize" )
            , ( cursor swResize, "sw-resize" )
            , ( cursor wResize, "w-resize" )
            , ( cursor ewResize, "ew-resize" )
            , ( cursor nsResize, "ns-resize" )
            , ( cursor neswResize, "nesw-resize" )
            , ( cursor nwseResize, "nwse-resize" )
            , ( cursor colResize, "col-resize" )
            , ( cursor rowResize, "row-resize" )
            , ( cursor allScroll, "all-scroll" )
            , ( cursor zoomIn, "zoom-in" )
            , ( cursor zoomOut, "zoom-out" )
            , ( cursor grab, "grab" )
            , ( cursor grabbing, "grabbing" )
            , ( cursor default, "default" )
            , ( cursor auto, "auto" )
            , ( cursor none, "none" )
            , ( cursor initial, "initial" )
            , ( cursor inherit, "inherit" )
            ]
        , testProperty { functionName = "outline3", property = "outline" }
            [--  ( outline3 (px 10) dashed (hsl 120 0.5 0.5), "10px dashed hsl(120,50%,50%)" )
             -- , ( outline3 (em 1.4) solid (hsla 120 0.5 0.5 0.5), "1.4em solid hsla(120,50%,50%,0.5)" )
             -- , ( outline inherit, "inherit" )
             -- , ( outline unset, "unset" )
             -- , ( outline initial, "initial" )
             -- , ( outline zero, "0" )
             -- , ( outline none, "none" )
            ]
        , testProperty { functionName = "outlineWidth", property = "outline-width" }
            [--  ( outlineWidth (px 10), "10px" )
             -- , ( outlineWidth (em 1.4), "1.4em" )
             -- , ( outlineWidth (pct 20), "20%" )
             -- , ( outlineWidth inherit, "inherit" )
             -- , ( outlineWidth unset, "unset" )
             -- , ( outlineWidth initial, "initial" )
             -- , ( outlineWidth zero, "0" )
             -- , ( outlineWidth none, "none" )
            ]
        , testProperty { functionName = "outlineColor", property = "outline-color" }
            [--  ( outlineColor (hsl 120 0.5 0.5), "hsl(120,50%,50%)" )
             -- , ( outlineColor (hsla 120 0.5 0.5 0.5), "hsla(120,50%,50%,0.5)" )
             -- , ( outlineColor transparent, "transparent" )
             -- , ( outlineColor inherit, "inherit" )
             -- , ( outlineColor unset, "unset" )
             -- , ( outlineColor initial, "initial" )
            ]
        , testProperty { functionName = "outlineStyle", property = "outline-style" }
            [--  ( outlineStyle none, "none" )
             -- , ( outlineStyle dashed, "dashed" )
             -- , ( outlineStyle dotted, "dotted" )
             -- , ( outlineStyle inherit, "inherit" )
             -- , ( outlineStyle unset, "unset" )
             -- , ( outlineStyle initial, "initial" )
            ]
        , testProperty { functionName = "outlineOffset", property = "outline-offset" }
            [--  ( outlineOffset zero, "0" )
             -- , ( outlineOffset (px 10), "10px" )
             -- , ( outlineOffset (pct 10), "10%" )
             -- , ( outlineOffset inherit, "inherit" )
             -- , ( outlineOffset unset, "unset" )
             -- , ( outlineOffset initial, "initial" )
            ]
        , testProperty { functionName = "listStyleType", property = "list-style-type" }
            [--  ( listStyleType none, "none" )
             -- , ( listStyleType initial, "initial" )
             -- , ( listStyleType inherit, "inherit" )
             -- , ( listStyleType disc, "disc" )
             -- , ( listStyleType circle, "circle" )
             -- , ( listStyleType square, "square" )
             -- , ( listStyleType decimal, "decimal" )
             -- , ( listStyleType decimalLeadingZero, "decimal-leading-zero" )
             -- , ( listStyleType lowerRoman, "lower-roman" )
             -- , ( listStyleType upperRoman, "upper-roman" )
             -- , ( listStyleType lowerGreek, "lower-greek" )
             -- , ( listStyleType lowerAlpha, "lower-alpha" )
             -- , ( listStyleType lowerLatin, "lower-latin" )
             -- , ( listStyleType upperAlpha, "upper-alpha" )
             -- , ( listStyleType upperLatin, "upper-latin" )
             -- , ( listStyleType arabicIndic, "arabic-indic" )
             -- , ( listStyleType armenian, "armenian" )
             -- , ( listStyleType bengali, "bengali" )
             -- , ( listStyleType cjkEarthlyBranch, "cjk-earthly-branch" )
             -- , ( listStyleType cjkHeavenlyStem, "cjk-heavenly-stem" )
             -- , ( listStyleType devanagari, "devanagari" )
             -- , ( listStyleType georgian, "georgian" )
             -- , ( listStyleType gujarati, "gujarati" )
             -- , ( listStyleType gurmukhi, "gurmukhi" )
             -- , ( listStyleType kannada, "kannada" )
             -- , ( listStyleType khmer, "khmer" )
             -- , ( listStyleType lao, "lao" )
             -- , ( listStyleType malayalam, "malayalam" )
             -- , ( listStyleType myanmar, "myanmar" )
             -- , ( listStyleType oriya, "oriya" )
             -- , ( listStyleType telugu, "telugu" )
             -- , ( listStyleType thai, "thai" )
            ]
        , testProperty { functionName = "listStylePosition", property = "list-style-position" }
            [ ( listStylePosition inherit, "inherit" )
            , ( listStylePosition initial, "initial" )
            , ( listStylePosition unset, "unset" )
            , ( listStylePosition inside, "inside" )
            , ( listStylePosition outside, "outside" )
            ]
        , testProperty { functionName = "listStyle", property = "list-style" }
            [ ( listStyle inherit, "inherit" )
            , ( listStyle initial, "initial" )
            , ( listStyle unset, "unset" )

            -- , ( listStyle none, "none" )
            -- , ( listStyle inside, "inside" )
            -- , ( listStyle outside, "outside" )
            -- , ( listStyle disc, "disc" )
            -- , ( listStyle circle, "circle" )
            -- , ( listStyle square, "square" )
            -- , ( listStyle decimal, "decimal" )
            -- , ( listStyle (linearGradient (stop <| hex "111") (stop <| hex "222") []), "linear-gradient(#111, #222)" )
            ]
        , testProperty { functionName = "listStyle2", property = "list-style" }
            [--  ( listStyle2 disc inside, "disc inside" )
             -- , ( listStyle2 inside disc, "inside disc" )
             -- , ( listStyle2 outside decimal, "outside decimal" )
             -- , ( listStyle3 disc inside none, "disc inside none" )
             -- , ( listStyle3 inside none circle, "inside none circle" )
             -- , ( listStyle3 none outside decimal, "none outside decimal" )
            ]
        , testProperty { functionName = "boxShadow", property = "box-shadow" }
            [--  ( boxShadow none, "none" )
             -- , ( boxShadow initial, "initial" )
             -- , ( boxShadow unset, "unset" )
             -- , ( boxShadow2 (px 1) (px 2), "1px 2px" )
             -- , ( boxShadow3 (px 1) (px 2) (hex "333"), "1px 2px #333" )
             -- , ( boxShadow3 (px 1) (px 2) (px 3), "1px 2px 3px" )
             -- , ( boxShadow3 inset (px 2) (px 3), "inset 2px 3px" )
             -- , ( boxShadow4 (px 1) (px 2) (px 3) (hex "333"), "1px 2px 3px #333" )
             -- , ( boxShadow4 inset (px 2) (px 3) (hex "333"), "inset 2px 3px #333" )
             -- , ( boxShadow4 (px 1) (px 2) (px 3) (px 4), "1px 2px 3px 4px" )
             -- , ( boxShadow4 inset (px 2) (px 3) (px 4), "inset 2px 3px 4px" )
             -- , ( boxShadow5 (px 1) (px 2) (px 3) (px 4) (hex "333"), "1px 2px 3px 4px #333" )
             -- , ( boxShadow5 inset (px 2) (px 3) (px 4) (hex "333"), "inset 2px 3px 4px #333" )
             -- , ( boxShadow6 inset (px 1) (px 2) (px 3) (px 4) (hex "333"), "inset 1px 2px 3px 4px #333" )
            ]
        , testProperty { functionName = "zIndex", property = "z-index" }
            [ ( zIndex auto, "auto" )
            , ( zIndex inherit, "inherit" )
            , ( zIndex initial, "initial" )
            , ( zIndex unset, "unset" )
            , ( zIndex (int 5), "5" )
            ]
        , testProperty { functionName = "backgroundImage", property = "background-image" }
            [ ( backgroundImage initial, "initial" )
            , ( backgroundImage unset, "unset" )
            , ( backgroundImage inherit, "inherit" )
            , ( backgroundImage none, "none" )
            , ( backgroundImage (url "blah.com"), "url(blah.com)" )
            ]
        , testProperty { functionName = "borderRadius", property = "border-radius" }
            [ ( borderRadius (em 4), "4em" )
            , ( borderRadius2 (em 4) (px 2), "4em 2px" )
            , ( borderRadius3 (em 4) (px 2) (pct 5), "4em 2px 5%" )
            , ( borderRadius4 (em 4) (px 2) (pct 5) (px 3), "4em 2px 5% 3px" )
            ]
        , testProperty { functionName = "important", property = "background-color" }
            [-- ( backgroundColor (rgb 129 20 100) |> important, "rgb(129,20,100) !important" )
            ]
        , testProperty { functionName = "whiteSpace", property = "white-space" }
            [ ( whiteSpace initial, "initial" )
            , ( whiteSpace unset, "unset" )
            , ( whiteSpace inherit, "inherit" )
            , ( whiteSpace normal, "normal" )
            , ( whiteSpace nowrap, "nowrap" )
            , ( whiteSpace pre, "pre" )
            , ( whiteSpace preWrap, "pre-wrap" )
            , ( whiteSpace preLine, "pre-line" )
            ]
        , testProperty { functionName = "tableLayout", property = "table-layout" }
            [ ( tableLayout inherit, "inherit" )
            , ( tableLayout initial, "initial" )
            , ( tableLayout unset, "unset" )
            , ( tableLayout auto, "auto" )
            , ( tableLayout fixed, "fixed" )
            ]
        , testProperty { functionName = "animationName", property = "animation-name" }
            [--  ( animationName inherit, "inherit" )
             -- , ( animationName initial, "initial" )
             -- , ( animationName unset, "unset" )
             -- , ( animationName none, "none" )
             -- -- for animationName tests with keyframes, see the Keyframes module
            ]
        ]


testOneValuedProperty { function, functionName, property } valuePairs =
    testProperty { functionName = functionName, property = property }
        (List.map (\( value, str ) -> ( function value, str )) valuePairs ++ testCssWideValues function)


testProperty : { functionName : String, property : String } -> List ( Style, String ) -> Test
testProperty { functionName, property } modifierPairs =
    describe functionName
        (List.map (expectPropertyWorks property) modifierPairs)


expectPropertyWorks : String -> ( Style, String ) -> Test
expectPropertyWorks propertyName ( style, expectedStr ) =
    describe (propertyName ++ ": " ++ expectedStr)
        [ test "emitted as expected" <|
            \() ->
                toPropertyStrings [ style ]
                    |> Expect.equal [ propertyName ++ ":" ++ expectedStr ]
        ]



{- <https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Values_and_Units> -}


testCssWideValues :
    (Value
        { provides
            | initial : Supported
            , inherit : Supported
            , unset : Supported
            , revert : Supported
        }
     -> Style
    )
    -> List ( Style, String )
testCssWideValues propertyUnderTest =
    [ ( propertyUnderTest initial, "initial" )
    , ( propertyUnderTest inherit, "inherit" )
    , ( propertyUnderTest unset, "unset" )
    , ( propertyUnderTest revert, "revert" )
    ]


testLength :
    List
        ( Value
            { supported
                | ch : Supported
                , cm : Supported
                , em : Supported
                , ex : Supported
                , inches : Supported
                , mm : Supported
                , pc : Supported
                , pt : Supported
                , px : Supported
                , rem : Supported
                , vh : Supported
                , vw : Supported
                , vmax : Supported
                , vmin : Supported
                , zero : Supported
                , calc : Supported
            }
        , String
        )
testLength =
    [ ( ch 2.3, "2.3ch" )
    , ( cm 13.3, "13.3cm" )
    , ( em 0.625, "0.625em" )
    , ( ex 3.14, "3.14ex" )
    , ( inches 2.54, "2.54in" )
    , ( mm 12.345, "12.345mm" )
    , ( pc 7.7, "7.7pc" )
    , ( pt 65.4, "65.4pt" )
    , ( px 1.5, "1.5px" )
    , ( rem 5.3, "5.3rem" )
    , ( vh 99.54, "99.54vh" )
    , ( vw 33.333, "33.333vw" )
    , ( vmax 4.73, "4.73vmax" )
    , ( vmin 12.7, "12.7vmin" )
    , ( zero, "0" )
    , ( calc (rem 3.2) (minus (px 5.5)), "calc(3.2rem - 5.5px)" )
    ]


testLineWidth :
    List
        ( Value
            { supported
                | ch : Supported
                , cm : Supported
                , em : Supported
                , ex : Supported
                , inches : Supported
                , mm : Supported
                , pc : Supported
                , pt : Supported
                , px : Supported
                , rem : Supported
                , vh : Supported
                , vw : Supported
                , vmax : Supported
                , vmin : Supported
                , zero : Supported
                , calc : Supported
                , thin : Supported
                , medium : Supported
                , thick : Supported
            }
        , String
        )
testLineWidth =
    testLength
        ++ [ ( thin, "thin" )
           , ( medium, "medium" )
           , ( thick, "thick" )
           ]


testLineStyle :
    List
        ( Value
            { provides
                | none : Supported
                , solid : Supported
                , dotted : Supported
                , dashed : Supported
                , hidden : Supported
                , double : Supported
                , groove : Supported
                , ridge : Supported
                , inset : Supported
                , outset : Supported
            }
        , String
        )
testLineStyle =
    [ ( none, "none" )
    , ( solid, "solid" )
    , ( dotted, "dotted" )
    , ( dashed, "dashed" )
    , ( hidden, "hidden" )
    , ( double, "double" )
    , ( groove, "groove" )
    , ( ridge, "ridge" )
    , ( inset, "inset" )
    , ( outset, "outset" )
    ]


testColor :
    List
        ( Value
            { provides
                | hsl : Supported
                , hsla : Supported
                , rgb : Supported
                , rgba : Supported
                , hex : Supported
                , currentcolor : Supported
            }
        , String
        )
testColor =
    [ ( hsl 120 0.5 0.5, "hsl(120,50%,50%)" )
    , ( hsla 120 0.5 0.5 0.5, "hsla(120,50%,50%,0.5)" )
    , ( rgb 255 230 211, "rgb(255,230,211)" )
    , ( rgba 12 2 33 0.95, "rgba(12,2,33,0.95)" )
    , ( hex "fff", "#fff" )
    , ( hex "#14ac34", "#14ac34" )
    , ( hex "#000c", "#000c" )
    , ( hex "00112233", "#00112233" )
    , ( currentcolor, "currentcolor" )
    ]


testListStyleType :
    List
        ( Value
            { supported
                | customIdent : Supported
                , symbols : Supported
                , string : Supported
                , none : Supported
                , arabicIndic : Supported
                , armenian : Supported
                , bengali : Supported
                , cambodian : Supported
                , circle : Supported
                , cjkDecimal : Supported
                , cjkEarthlyBranch : Supported
                , cjkHeavenlyStem : Supported
                , cjkIdeographic : Supported
                , decimal : Supported
                , decimalLeadingZero : Supported
                , devanagari : Supported
                , disc : Supported
                , disclosureClosed : Supported
                , disclosureOpen : Supported
                , ethiopicNumeric : Supported
                , georgian : Supported
                , gujarati : Supported
                , gurmukhi : Supported
                , hebrew : Supported
                , hiragana : Supported
                , hiraganaIroha : Supported
                , japaneseFormal : Supported
                , japaneseInformal : Supported
                , kannada : Supported
                , katakana : Supported
                , katakanaIroha : Supported
                , khmer : Supported
                , koreanHangulFormal : Supported
                , koreanHanjaFormal : Supported
                , koreanHanjaInformal : Supported
                , lao : Supported
                , lowerAlpha : Supported
                , lowerArmenian : Supported
                , lowerGreek : Supported
                , lowerLatin : Supported
                , lowerRoman : Supported
                , malayalam : Supported
                , monogolian : Supported
                , myanmar : Supported
                , oriya : Supported
                , persian : Supported
                , simpChineseFormal : Supported
                , simpChineseInformal : Supported
                , square : Supported
                , tamil : Supported
                , telugu : Supported
                , thai : Supported
                , tibetan : Supported
                , tradChineseFormal : Supported
                , tradChineseInformal : Supported
                , upperAlpha : Supported
                , upperArmenian : Supported
                , upperLatin : Supported
                , upperRoman : Supported
            }
        , String
        )
testListStyleType =
    [ ( none, "none" )
    , ( string "arbitrary\n\"\\", "\"arbitrary\\A \\\"\\\\\"" )
    , ( customIdent "hello-world", "hello-world" )
    , ( symbols (string "*") [ string "†" ], "symbols(\"*\" \"†\")" )
    , ( symbols2 cyclic (url "https://example.com") [], "symbols(cyclic url(https://example.com))" )
    , ( symbols2 numeric (string "*") [ url "https://example.com" ], "symbols(numeric \"*\" url(https://example.com))" )
    , ( symbols2 alphabetic (linearGradient (stop <| hex "111") (stop <| hex "222") []) [ string "*" ], "symbols(alphabetic linear-gradient(#111 #222)\"*\"" )
    , ( symbols2 symbolic (url "https://example.com") [], "symbols(symbolic url(https://example.com))" )
    , ( symbols2 fixed (url "https://example.com") [], "symbols(fixed url(https://example.com))" )
    , ( arabicIndic, "arabic-indic" )
    , ( armenian, "armenian" )
    , ( bengali, "bengali" )
    , ( cambodian, "cambodian" )
    , ( circle, "circle" )
    , ( cjkDecimal, "cjk-decimal" )
    , ( cjkEarthlyBranch, "cjk-earthly-branch" )
    , ( cjkHeavenlyStem, "cjk-heavenly-stem" )
    , ( cjkIdeographic, "cjk-ideographic" )
    , ( decimal, "decimal" )
    , ( decimalLeadingZero, "decimal-leading-zero" )
    , ( devanagari, "devanagari" )
    , ( disc, "disc" )
    , ( disclosureClosed, "disclosure-closed" )
    , ( disclosureOpen, "disclosure-open" )
    , ( ethiopicNumeric, "ethiopic-numeric" )
    , ( georgian, "georgian" )
    , ( gujarati, "gujarati" )
    , ( gurmukhi, "gurmukhi" )
    , ( hebrew, "hebrew" )
    , ( hiragana, "hiragana" )
    , ( hiraganaIroha, "hiragana-iroha" )
    , ( japaneseFormal, "japanese-formal" )
    , ( japaneseInformal, "japanese-informal" )
    , ( kannada, "kannada" )
    , ( katakana, "katakana" )
    , ( katakanaIroha, "katakana-iroha" )
    , ( khmer, "khmer" )
    , ( koreanHangulFormal, "korean-hangul-formal" )
    , ( koreanHanjaFormal, "korean-hanja-formal" )
    , ( koreanHanjaInformal, "korean-hanja-informal" )
    , ( lao, "lao" )
    , ( lowerAlpha, "lower-alpha" )
    , ( lowerArmenian, "lower-armenian" )
    , ( lowerGreek, "lower-greek" )
    , ( lowerLatin, "lower-latin" )
    , ( lowerRoman, "lower-roman" )
    , ( malayalam, "malayalam" )
    , ( myanmar, "myanmar" )
    , ( oriya, "oriya" )
    , ( persian, "persian" )
    , ( simpChineseFormal, "simp-chinese-formal" )
    , ( simpChineseInformal, "simp-chinese-informal" )
    , ( square, "square" )
    , ( tamil, "tamil" )
    , ( telugu, "telugu" )
    , ( thai, "thai" )
    , ( tibetan, "tibetan" )
    , ( tradChineseFormal, "trad-chinese-formal" )
    , ( tradChineseInformal, "trad-chinese-informal" )
    , ( upperAlpha, "upper-alpha" )
    , ( upperArmenian, "upper-armenian" )
    , ( upperLatin, "upper-latin" )
    , ( upperRoman, "upper-roman" )
    ]
