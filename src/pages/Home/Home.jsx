import { Link } from 'react-router-dom';
import { motion } from 'framer-motion';

const Home = () => {
  return (
    <div className='min-h-screen bg-gray-100 dark:bg-gray-900 transition-colors duration-300'>
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.8 }}
        className='container mx-auto px-4 py-16'
      >
        <h1 className='text-5xl font-bold text-center text-gray-800 dark:text-white mb-8 transition-colors duration-300'>
          Welcome to Music Stream
        </h1>
        <p className='text-2xl text-center text-gray-600 dark:text-gray-300 mb-12 transition-colors duration-300'>
          Discover, listen, and enjoy your favorite music
        </p>
        <motion.div
          className='flex flex-col sm:flex-row justify-center space-y-4 sm:space-y-0 sm:space-x-6'
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.3, duration: 0.5 }}
        >
          <Link
            to='/search'
            className='bg-blue-500 hover:bg-blue-600 dark:bg-blue-600 dark:hover:bg-blue-700 text-white font-semibold py-3 px-8 rounded-lg transition duration-300 transform hover:scale-105 shadow-lg'
          >
            Explore Music
          </Link>
          <Link
            to='/player'
            className='bg-green-500 hover:bg-green-600 dark:bg-green-600 dark:hover:bg-green-700 text-white font-semibold py-3 px-8 rounded-lg transition duration-300 transform hover:scale-105 shadow-lg'
          >
            Go to Player
          </Link>
        </motion.div>
      </motion.div>
    </div>
  );
};

export default Home;
