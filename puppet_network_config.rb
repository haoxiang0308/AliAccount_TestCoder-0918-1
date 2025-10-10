# frozen_string_literal: true

require 'puppet'

Puppet::Type.newtype(:network_config) do
  @doc = 'Custom Puppet type for managing network configurations.'

  ensurable

  newparam(:name, namevar: true) do
    desc 'The name of the network interface.'
  end

  newproperty(:ipaddress) do
    desc 'The IP address for the interface.'
  end

  newproperty(:netmask) do
    desc 'The netmask for the interface.'
  end

  newproperty(:gateway) do
    desc 'The default gateway for the interface.'
  end
end
