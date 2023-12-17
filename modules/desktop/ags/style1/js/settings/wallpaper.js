import options from '../options.js';
import { exec, execAsync } from 'resource:///com/github/Aylur/ags/utils.js';
import GLib from 'gi://GLib';
import { dependencies } from '../utils.js';

export function initWallpaper() {
    if (dependencies(['swww'])) {
        exec('swww init');

        options.desktop.wallpaper.img.connect('changed', wallpaper);
    }
}

export function wallpaper() {
    const backgrounds = GLib.get_home_dir() + '/.config/backgrounds';
    if (!dependencies(['swww']))
        return;

    execAsync([
        'swww', 'img',
        '--transition-step', '4',
        '-f',
        'CatmullRom', '--transition-fps', '120',
        options.desktop.wallpaper.img.value,
    ])
    .catch(err => console.error(err));
    execAsync([
        'cp', options.desktop.wallpaper.img.value, `${backgrounds}/last/image.png`
    ]);
    exec(`sh -c ~/.config/ags/prepare_background.sh`)

}
