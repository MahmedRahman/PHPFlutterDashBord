<?php

// autoload_real.php @generated by Composer

class ComposerAutoloaderInitc23317953e3a7bb64c7a73bcf7f3a179
{
    private static $loader;

    public static function loadClassLoader($class)
    {
        if ('Composer\Autoload\ClassLoader' === $class) {
            require __DIR__ . '/ClassLoader.php';
        }
    }

    /**
     * @return \Composer\Autoload\ClassLoader
     */
    public static function getLoader()
    {
        if (null !== self::$loader) {
            return self::$loader;
        }

        require __DIR__ . '/platform_check.php';

        spl_autoload_register(array('ComposerAutoloaderInitc23317953e3a7bb64c7a73bcf7f3a179', 'loadClassLoader'), true, true);
        self::$loader = $loader = new \Composer\Autoload\ClassLoader(\dirname(__DIR__));
        spl_autoload_unregister(array('ComposerAutoloaderInitc23317953e3a7bb64c7a73bcf7f3a179', 'loadClassLoader'));

        require __DIR__ . '/autoload_static.php';
        call_user_func(\Composer\Autoload\ComposerStaticInitc23317953e3a7bb64c7a73bcf7f3a179::getInitializer($loader));

        $loader->register(true);

        return $loader;
    }
}
