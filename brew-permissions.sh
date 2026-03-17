#!/bin/bash

# Define the shared group and users
GROUP_NAME="brew"
USERS=("cllpse" "wrk")
BREW_PREFIX=$(brew --prefix)
BREW_CACHE=$(brew --cache)

echo "--- Starting Homebrew Shared Setup ---"

# 1. Create the group if it doesn't exist
if ! dscl . -list /Groups | grep -q "^$GROUP_NAME$"; then
    echo "Creating group: $GROUP_NAME"
    sudo dseditgroup -o create "$GROUP_NAME"
else
    echo "Group '$GROUP_NAME' already exists."
fi

# 2. Add users to the group
for user in "${USERS[@]}"; do
    echo "Ensuring user '$user' is in group '$GROUP_NAME'..."
    sudo dseditgroup -o edit -a "$user" -t user "$GROUP_NAME"
done

# 3. Fix Ownership and Permissions
echo "Applying group ownership and write permissions to $BREW_PREFIX..."
sudo chgrp -R "$GROUP_NAME" "$BREW_PREFIX" "$BREW_CACHE"
sudo chmod -R g+w "$BREW_PREFIX" "$BREW_CACHE"

# 4. Set the 'SetGID' bit
# This ensures new subdirectories inherit the 'brew' group automatically
sudo find "$BREW_PREFIX" -type d -exec chmod g+s {} +

echo "--- Setup Complete ---"
echo "IMPORTANT: Users 'cllpse' and 'wrk' must log out and back in for changes to take effect."
