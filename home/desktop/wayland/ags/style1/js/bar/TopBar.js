import SystemTray from 'resource:///com/github/Aylur/ags/service/systemtray.js';
import Battery from 'resource:///com/github/Aylur/ags/service/battery.js';
import OverviewButton from './buttons/OverviewButton.js';
import Workspaces from './buttons/Workspaces.js';
import DateButton from './buttons/DateButton.js';
import SysTray from './buttons/SysTray.js';
import SystemIndicators from './buttons/SystemIndicators.js';
import PowerMenu from './buttons/PowerMenu.js';
import ScreenRecord from './buttons/ScreenRecord.js';
import SubMenu from './buttons/SubMenu.js';
import Recorder from '../services/screenrecord.js';
import options from '../options.js';
import * as vars from '../variables.js';

const submenuItems = Variable(1);
SystemTray.connect('changed', () => {
    submenuItems.setValue(SystemTray.items.length + 1);
});

/**
 * @template {import('types/service').default} T
 * @param {T=} service
 * @param {(self: T) => boolean=} condition
 */

const SeparatorDot = (service, condition) => Widget.Separator({
    vpack: 'center',
    setup: self => {
        const visibility = () => {
            if (!options.bar.separators.value)
                return self.visible = false;

            self.visible = condition && service
                ? condition(service)
                : options.bar.separators.value;
        };

        if (service && condition)
            self.hook(service, visibility);

        self.on('draw', visibility);
        self.bind('visible', options.bar.separators);
    },
});

const Start = () => Widget.Box({
    class_name: 'start',
    children: [
        OverviewButton(),
        SeparatorDot(),
        Workspaces(),
        Widget.Box({ hexpand: true }),
    ],
});

const Center = () => Widget.Box({
    class_name: 'center',
    children: [
        DateButton(),
    ],
});

const SysProgress = (type, title, unit) => Widget.Box({
    class_name: `circular-progress-box ${type}`,
    hexpand: false,
    binds: [['tooltipText', vars[type], 'value', v =>
        `${title}: ${Math.floor(v * 100)}${unit}`]],
    child: Widget.CircularProgress({
        hexpand: true,
        inverted: false,
        class_name: `circular-progress ${type}`,
        binds: [['value', vars[type]]],
        start_at: 0.75,
    }),
});

const End = () => Widget.Box({
    class_name: 'end',
    children: [
        Widget.Box({ hexpand: true }),

        SubMenu({
            items: submenuItems,
            children: [
                SysTray(),
                ColorPicker(),
            ],
        }),

        Widget.Box({
            class_name: 'system-info horizontal',
            children: [
                SysProgress('cpu', 'Cpu', '%'),
                SysProgress('ram', 'Ram', '%'),
                SysProgress('temp', 'Temperature', '°'),
            ],
        }),

        SeparatorDot(),
        ScreenRecord(),
        SeparatorDot(Recorder, r => r.recording),
        BatteryBar(Battery, b => b.available),
        SeparatorDot(Battery, b => b.available),
        SystemIndicators(),
        SeparatorDot(),
        PowerMenu(),
    ],
});

/** @param {number} monitor */
export default monitor => Widget.Window({
    name: `bar${monitor}`,
    class_name: 'transparent',
    exclusivity: 'exclusive',
    monitor,
    anchor: options.bar.position.bind('value').transform(pos => ([
        pos, 'left', 'right',
    ])),

    child: Widget.CenterBox({
        class_name: 'panel',
        start_widget: Start(),
        center_widget: Center(),
        end_widget: End(),
    }),
});
