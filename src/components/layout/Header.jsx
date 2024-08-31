import { Link } from 'react-router-dom';
import { useAuth } from '../../hooks/useAuth';
import { useState, useEffect } from 'react';

const Header = () => {
  const { user, logout } = useAuth();
  const [darkMode, setDarkMode] = useState(false);

  useEffect(() => {
    if (darkMode) {
      document.documentElement.classList.add('dark');
    } else {
      document.documentElement.classList.remove('dark');
    }
  }, [darkMode]);

  const toggleDarkMode = () => {
    setDarkMode(!darkMode);
  };

  return (
    <header className='bg-white dark:bg-gray-800 text-gray-800 dark:text-gray-200 shadow-sm transition-colors duration-300'>
      <div className='container mx-auto px-4 py-4'>
        <div className='flex justify-between items-center'>
          <Link
            to='/'
            className='text-2xl font-bold hover:text-blue-600 dark:hover:text-blue-400 transition duration-300'
          >
            Music Stream
          </Link>
          <nav className='flex items-center'>
            <ul className='flex space-x-6 mr-6'>
              <li>
                <Link
                  to='/'
                  className='hover:text-blue-600 dark:hover:text-blue-400 transition duration-300'
                >
                  Home
                </Link>
              </li>
              <li>
                <Link
                  to='/search'
                  className='hover:text-blue-600 dark:hover:text-blue-400 transition duration-300'
                >
                  Search
                </Link>
              </li>
              {user ? (
                <>
                  <li>
                    <Link
                      to='/player'
                      className='hover:text-blue-600 dark:hover:text-blue-400 transition duration-300'
                    >
                      Player
                    </Link>
                  </li>
                  {user.role === 'admin' && (
                    <li>
                      <Link
                        to='/admin'
                        className='hover:text-blue-600 dark:hover:text-blue-400 transition duration-300'
                      >
                        Admin
                      </Link>
                    </li>
                  )}
                  <li>
                    <button
                      onClick={logout}
                      className='bg-red-100 dark:bg-red-700 hover:bg-red-200 dark:hover:bg-red-600 text-red-600 dark:text-red-100 font-semibold py-1 px-3 rounded transition duration-300'
                    >
                      Logout
                    </button>
                  </li>
                </>
              ) : (
                <li>
                  <Link
                    to='/login'
                    className='bg-blue-100 dark:bg-blue-700 hover:bg-blue-200 dark:hover:bg-blue-600 text-blue-600 dark:text-blue-100 font-semibold py-1 px-4 rounded transition duration-300'
                  >
                    Login
                  </Link>
                </li>
              )}
            </ul>
            <button
              onClick={toggleDarkMode}
              className='p-2 rounded-full bg-gray-200 dark:bg-gray-600 text-gray-800 dark:text-gray-200 hover:bg-gray-300 dark:hover:bg-gray-500 transition duration-300'
            >
              {darkMode ? '🌞' : '🌙'}
            </button>
          </nav>
        </div>
      </div>
    </header>
  );
};

export default Header;
