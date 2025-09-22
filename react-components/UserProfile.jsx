import React from 'react';
import PropTypes from 'prop-types';

const UserProfile = ({ profile }) => {
  return (
    <div className="user-profile">
      <div className="profile-header">
        {profile.avatarUrl ? (
          <img 
            src={profile.avatarUrl} 
            alt={profile.name}
            className="avatar"
          />
        ) : (
          <div className="default-avatar">{profile.name.charAt(0)}</div>
        )}
        <h2>{profile.name}</h2>
      </div>
      
      <div className="profile-details">
        <p><strong>Email:</strong> {profile.email}</p>
        {profile.bio && <p><strong>Bio:</strong> {profile.bio}</p>}
        {profile.location && <p><strong>Location:</strong> {profile.location}</p>}
        {profile.website && (
          <p>
            <strong>Website:</strong>{' '}
            <a href={profile.website} target="_blank" rel="noopener noreferrer">
              {profile.website}
            </a>
          </p>
        )}
      </div>
    </div>
  );
};

UserProfile.propTypes = {
  profile: PropTypes.shape({
    id: PropTypes.number.isRequired,
    name: PropTypes.string.isRequired,
    email: PropTypes.string.isRequired,
    avatarUrl: PropTypes.string,
    bio: PropTypes.string,
    location: PropTypes.string,
    website: PropTypes.string,
  }).isRequired,
};

export default UserProfile;