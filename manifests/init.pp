# == Class
#
# chocolatey_packages
#
# == Synopsis
#
# This class is used for managing chocolatey package installation for Windows machines across a domain with Puppet.
#
# == Author
#
# John McCarthy <midactsmystery@gmail.com>
#
# - http://www.midactstech.blogspot.com -
# - https://www.github.com/Midacts -
#
# == Date
#
# 4th of September, 2014
#
# -- Version 1.0 --
#
class chocolatey_packages {

  $provider	= 'chocolatey'

  if ($::operatingsystemmajrelease == '8')
  {
    package { 'GoogleChrome':
      ensure      => latest,
      provider    => $provider,
    }

    # file { 'C:\users\public\desktop\Google Chrome.lnk':
    #   ensure	=> absent,
    #   subscribe	=> Package['GoogleChrome'],
    # }

    package { 'Firefox':
      ensure      => latest,
      provider    => $provider,
    }

    file { 'C:\Users\Public\Desktop\Mozilla Firefox.lnk':
      ensure	=> absent,
      subscribe	=> Package['Firefox'],
    }

    # package { 'flashplayeractivex':
    #   ensure      => installed,
    #   provider    => $provider,
    # }

    # package { 'flashplayerplugin':
    #   ensure      => latest,
    #   provider    => $provider,
    # }

    package { 'adobereader':
      ensure      => latest,
      provider    => $provider,
      # require	=> Package['flashplayerplugin'],
    }

    file { 'C:\users\public\desktop\Acrobat Reader DC.lnk':
      ensure	=> absent,
      subscribe	=> Package['adobereader'],
    }

    # package { 'javaruntime':
    #   ensure      => latest,
    #   provider    => $provider,
    # }

    package { '7zip':
      ensure      => latest,
      provider    => $provider,
    }
  }

}
