import { useState } from 'react';
import { Home, Search, Radio, Heart, Clock, Music, Disc, Mic2, List, Plus } from 'lucide-react';
import { useNavigate } from 'react-router-dom';
const MenuItem = ({ icon: Icon, text, onClick }) => (
  <li
    className='flex items-center space-x-4 px-4 py-2 text-gray-700 dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-800 rounded-lg transition-colors duration-200 cursor-pointer'
    onClick={onClick}
  >
    <Icon size={20} className='text-gray-600 dark:text-gray-400' />
    <span className='font-medium'>{text}</span>
  </li>
);

const Sidebar = () => {
  const [searchTerm, setSearchTerm] = useState('');
  const navigate = useNavigate();
  return (
    <div className='w-64 h-screen bg-gradient-to-b from-white/90 to-white/70 dark:from-black/40 dark:to-black/30 backdrop-blur-lg text-gray-900 dark:text-white p-6 flex flex-col space-y-8 shadow-lg'>
      <div className='text-2xl font-bold text-gray-800 dark:text-gray-100 flex items-center space-x-2'>
        <Music size={28} />
        <span>Music Stream</span>
      </div>

      <div className='relative'>
        <input
          type='text'
          placeholder='Search...'
          value={searchTerm}
          onChange={(e) => setSearchTerm(e.target.value)}
          className='w-full py-2 px-4 bg-gray-100 dark:bg-gray-800 rounded-full text-sm focus:outline-none focus:ring-2 focus:ring-blue-500'
        />
        <Search size={18} className='absolute right-3 top-2.5 text-gray-500' />
      </div>

      <nav>
        <ul className='space-y-2'>
          <MenuItem icon={Home} text='Home' onClick={() => navigate('/')} />
          <MenuItem icon={Search} text='Discover' onClick={() => navigate('/discover')} />
          <MenuItem icon={Radio} text='Radio' onClick={() => navigate('/radio')} />
          <MenuItem icon={Music} text='Browse' onClick={() => navigate('/browse')} />
          <MenuItem icon={Heart} text='Library' onClick={() => navigate('/library')} />
        </ul>
      </nav>

      <div>
        <h3 className='text-sm uppercase text-gray-600 dark:text-gray-300 mb-3 font-semibold tracking-wider'>
          Your Library
        </h3>
        <ul className='space-y-2'>
          <MenuItem
            icon={Clock}
            text='Recently Played'
            onClick={() => navigate('/recently-played')}
          />
          <MenuItem icon={Heart} text='Liked Songs' onClick={() => navigate('/liked-songs')} />
          <MenuItem icon={Disc} text='Albums' onClick={() => navigate('/albums')} />
          <MenuItem icon={Mic2} text='Artists' onClick={() => navigate('/artists')} />
        </ul>
      </div>

      <div>
        <h3 className='text-sm uppercase text-gray-600 dark:text-gray-300 mb-3 font-semibold tracking-wider'>
          Playlists
        </h3>
        <ul className='space-y-2'>
          <MenuItem
            icon={List}
            text='Chill Hits'
            onClick={() => navigate('/playlists/chill-hits')}
          />
          <MenuItem icon={List} text='Top 50' onClick={() => navigate('/playlists/top-50')} />
          <MenuItem icon={List} text='Workout' onClick={() => navigate('/playlists/workout')} />
          <MenuItem icon={List} text='Party' onClick={() => navigate('/playlists/party')} />
          <li
            className='flex items-center space-x-4 px-4 py-2 text-blue-500 hover:text-blue-600 dark:text-blue-400 dark:hover:text-blue-300 rounded-lg transition-colors duration-200 cursor-pointer'
            onClick={() => navigate('/playlists/create')}
          >
            <Plus size={20} />
            <span className='font-medium'>Create Playlist</span>
          </li>
        </ul>
      </div>
    </div>
  );
};

export default Sidebar;
