node default{
    # Install vim
    class{'vim': }
    class{'ohmyzsh': }
    class{'common': }
    ohmyzsh::install{['root', 'dev']:}
    ohmyzsh::plugins { 'dev': plugins => 'colorize git github gem gitignore postgres mysql rails gnu-utils' }
    ohmyzsh::theme { 'dev': theme => 'avit' }
    

    class {'apache': 
        default_mods => false,
    }

    apache::vhost{'wordpress.example.com':
        port => '80',
        docroot => '/var/www/wordpress',
    }

    # Install vsftpd
    class{'vsftpd':
        anonymous_enable => 'NO',
        write_enable => 'YES',
        ftpd_banner => 'SysAdm Project',
        chroot_local_user => 'YES',
    }

    class { 'docker': 
        version => 'latest',
        dns => '8.8.8.8',
    }~>
    docker::image{'ubuntu':
        image_tag => 'precise',
    }


}
