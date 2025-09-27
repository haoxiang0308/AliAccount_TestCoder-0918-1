# frozen_string_literal: true

Puppet::Type.newtype(:network_interface) do
  @doc = 'Manage network interfaces'

  ensurable

  newparam(:name, namevar: true) do
    desc 'The name of the interface'
  end

  newproperty(:ipaddress) do
    desc 'The IP address for the interface'
  end

  newproperty(:netmask) do
    desc 'The netmask for the interface'
  end

  newproperty(:gateway) do
    desc 'The default gateway'
  end
end