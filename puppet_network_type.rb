# frozen_string_literal: true

require 'puppet'

Puppet::Type.newtype(:network_config) do
  @doc = 'Manages basic network configuration.'

  ensurable

  newparam(:name, namevar: true) do
    desc 'The name of the network interface.'
  end

  newproperty(:ipaddress) do
    desc 'The IP address for the interface.'
    validate do |value|
      # Basic IP address validation
      unless value =~ Resolv::IPv4::Regex
        raise ArgumentError, "Invalid IP address: #{value}"
      end
    end
  end

  newproperty(:netmask) do
    desc 'The netmask for the interface.'
    validate do |value|
      # Basic netmask validation
      unless value =~ Resolv::IPv4::Regex
        raise ArgumentError, "Invalid netmask: #{value}"
      end
    end
  end

  newproperty(:gateway) do
    desc 'The default gateway for the interface.'
    validate do |value|
      # Basic IP address validation for gateway
      unless value =~ Resolv::IPv4::Regex
        raise ArgumentError, "Invalid gateway: #{value}"
      end
    end
  end
end
