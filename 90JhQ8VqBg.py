import random
import string
import subprocess


class Puppet:
    """A class for network configuration tasks."""

    def __init__(self, interface_name):
        """Initialize the Puppet with a network interface name."""
        self.interface_name = interface_name

    def generate_random_name(self, length=8):
        """Generate a random name for configuration files."""
        letters = string.ascii_lowercase + string.digits
        return ''.join(random.choice(letters) for _ in range(length))

    def set_static_ip(self, ip_address, netmask, gateway):
        """Configure a static IP address for the interface (Linux example)."""
        # This is a simplified example. In practice, you would modify
        # system configuration files like /etc/network/interfaces or
        # use tools like nmcli for NetworkManager
        config_script = f"""#!/bin/bash
echo "Setting static IP for {self.interface_name}"
# Example commands (would need root privileges):
# ifconfig {self.interface_name} {ip_address} netmask {netmask}
# route add default gw {gateway}
echo "Configured {self.interface_name} with IP {ip_address}"
"""
        filename = f"{self.generate_random_name()}_network_config.sh"
        with open(filename, 'w') as f:
            f.write(config_script)
        print(f"Network configuration script saved to {filename}")
        return filename

    def apply_config(self, config_file):
        """Apply the network configuration (placeholder)."""
        # In practice, this would execute the configuration script
        # subprocess.run(['sudo', 'bash', config_file], check=True)
        print(f"Applying configuration from {config_file}")
        print("Note: In practice, this would require root privileges.")


# Example usage:
# puppet = Puppet("eth0")
# config_file = puppet.set_static_ip("192.168.1.100", "255.255.255.0", "192.168.1.1")
# puppet.apply_config(config_file)