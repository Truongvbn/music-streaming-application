import { Link } from 'react-router-dom';
import { useAuth } from '../../hooks/useAuth';
import { useState, useEffect } from 'react';
import {
  SkipBack,
  Play,
  Pause,
  SkipForward,
  Sun,
  Moon,
  User,
  LogOut,
  Volume2,
  Repeat,
  Shuffle,
} from 'lucide-react';

const Header = () => {
  const { user, logout } = useAuth();
  const [darkMode, setDarkMode] = useState(false);
  const [isPlaying, setIsPlaying] = useState(false);
  const [volume, setVolume] = useState(50);
  const [isShuffling, setIsShuffling] = useState(false);
  const [repeatMode, setRepeatMode] = useState('off'); // 'off', 'all', 'one'

  useEffect(() => {
    if (darkMode) {
      document.documentElement.classList.add('dark');
    } else {
      document.documentElement.classList.remove('dark');
    }
  }, [darkMode]);

  const toggleDarkMode = () => setDarkMode(!darkMode);
  const togglePlayPause = () => setIsPlaying(!isPlaying);
  const toggleShuffle = () => setIsShuffling(!isShuffling);
  const changeRepeatMode = () => {
    const modes = ['off', 'all', 'one'];
    const currentIndex = modes.indexOf(repeatMode);
    setRepeatMode(modes[(currentIndex + 1) % modes.length]);
  };

  const handlePrevious = () => {
    // Add logic to play previous track
  };

  const handleNext = () => {
    // Add logic to play next track
  };

  const handleVolumeChange = (e) => {
    setVolume(e.target.value);
    // Add logic to change actual volume
  };

  return (
    <header className='bg-white dark:bg-gray-900 text-gray-800 dark:text-gray-200 shadow-lg'>
      <div className='container mx-auto px-4 py-3'>
        <div className='flex justify-between items-center'>
          <div className='flex-1 flex justify-center items-center space-x-4'>
            <button
              onClick={toggleShuffle}
              className={`text-gray-600 dark:text-gray-400 hover:text-gray-800 dark:hover:text-gray-200 transition duration-300 ${isShuffling ? 'text-blue-500 dark:text-blue-400' : ''}`}
            >
              <Shuffle size={20} />
            </button>
            <button
              onClick={handlePrevious}
              className='text-gray-600 dark:text-gray-400 hover:text-gray-800 dark:hover:text-gray-200 transition duration-300'
            >
              <SkipBack size={24} />
            </button>
            <button
              onClick={togglePlayPause}
              className='text-gray-800 dark:text-gray-200 hover:text-gray-600 dark:hover:text-gray-400 bg-gray-200 dark:bg-gray-700 p-3 rounded-full shadow-md hover:shadow-lg transition duration-300'
            >
              {isPlaying ? <Pause size={28} /> : <Play size={28} />}
            </button>
            <button
              onClick={handleNext}
              className='text-gray-600 dark:text-gray-400 hover:text-gray-800 dark:hover:text-gray-200 transition duration-300'
            >
              <SkipForward size={24} />
            </button>
            <button
              onClick={changeRepeatMode}
              className={`text-gray-600 dark:text-gray-400 hover:text-gray-800 dark:hover:text-gray-200 transition duration-300 ${repeatMode !== 'off' ? 'text-blue-500 dark:text-blue-400' : ''}`}
            >
              <Repeat size={20} />
              {repeatMode === 'one' && <span className='text-xs absolute'>1</span>}
            </button>
          </div>
          <div className='flex-1 flex justify-center items-center'>
            <div className='w-full max-w-md'>
              <div className='w-full bg-gray-200 dark:bg-gray-700 h-2 rounded-full overflow-hidden'>
                <div className='bg-blue-500 dark:bg-blue-400 w-1/2 h-full rounded-full transition-all duration-300 ease-in-out'></div>
              </div>
            </div>
          </div>
          <div className='flex-1 flex justify-end items-center space-x-4'>
            <div className='flex items-center space-x-2'>
              <Volume2 size={20} className='text-gray-600 dark:text-gray-400' />
              <input
                type='range'
                min='0'
                max='100'
                value={volume}
                onChange={handleVolumeChange}
                className='w-24 h-2 bg-gray-200 dark:bg-gray-700 rounded-lg appearance-none cursor-pointer'
              />
            </div>
            <nav className='flex items-center space-x-4'>
              {user ? (
                <>
                  <Link
                    to='/profile'
                    className='flex items-center space-x-2 text-gray-600 dark:text-gray-400 hover:text-gray-800 dark:hover:text-gray-200 transition-colors duration-200'
                  >
                    <User size={20} />
                  </Link>
                  <button
                    onClick={logout}
                    className='text-gray-600 dark:text-gray-400 hover:text-gray-800 dark:hover:text-gray-200 transition-colors duration-200'
                  >
                    <LogOut size={20} />
                  </button>
                </>
              ) : (
                <Link
                  to='/login'
                  className='bg-blue-500 hover:bg-blue-600 text-white font-semibold py-2 px-4 rounded-lg transition duration-300 shadow-md hover:shadow-lg'
                >
                  Login
                </Link>
              )}
              <button
                onClick={toggleDarkMode}
                className='p-2 rounded-full bg-gray-200 dark:bg-gray-700 text-gray-800 dark:text-gray-200 hover:bg-gray-300 dark:hover:bg-gray-600 transition duration-300 shadow-md hover:shadow-lg'
              >
                {darkMode ? <Sun size={20} /> : <Moon size={20} />}
              </button>
            </nav>
          </div>
        </div>
      </div>
    </header>
  );
};

export default Header;
