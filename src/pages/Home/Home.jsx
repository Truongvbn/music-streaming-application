import { motion } from 'framer-motion';
import { useState, useRef, useEffect } from 'react';
import { ChevronLeft, ChevronRight, Headphones, Mic, Radio, Star } from 'lucide-react';

const Home = () => {
  const [featuredContent] = useState([
    {
      id: 1,
      title: 'Top Charts',
      items: [
        {
          name: 'Blinding Lights',
          artist: 'The Weeknd',
          cover: 'https://example.com/blinding-lights.jpg',
        },
        {
          name: 'Dance Monkey',
          artist: 'Tones and I',
          cover: 'https://example.com/dance-monkey.jpg',
        },
        {
          name: 'Watermelon Sugar',
          artist: 'Harry Styles',
          cover: 'https://example.com/watermelon-sugar.jpg',
        },
        {
          name: "Don't Start Now",
          artist: 'Dua Lipa',
          cover: 'https://example.com/dont-start-now.jpg',
        },
        { name: 'Circles', artist: 'Post Malone', cover: 'https://example.com/circles.jpg' },
      ],
      icon: <Star size={28} />,
    },
    {
      id: 2,
      title: 'New Releases',
      items: [
        { name: 'Butter', artist: 'BTS', cover: 'https://example.com/butter.jpg' },
        {
          name: 'Leave The Door Open',
          artist: 'Silk Sonic',
          cover: 'https://example.com/leave-the-door-open.jpg',
        },
        { name: 'Peaches', artist: 'Justin Bieber', cover: 'https://example.com/peaches.jpg' },
        {
          name: 'Kiss Me More',
          artist: 'Doja Cat ft. SZA',
          cover: 'https://example.com/kiss-me-more.jpg',
        },
        { name: 'Levitating', artist: 'Dua Lipa', cover: 'https://example.com/levitating.jpg' },
      ],
      icon: <Headphones size={28} />,
    },
    {
      id: 3,
      title: 'Popular Podcasts',
      items: [
        {
          name: 'The Joe Rogan Experience',
          host: 'Joe Rogan',
          cover: 'https://example.com/joe-rogan.jpg',
        },
        {
          name: 'Crime Junkie',
          host: 'Ashley Flowers',
          cover: 'https://example.com/crime-junkie.jpg',
        },
        { name: 'TED Radio Hour', host: 'NPR', cover: 'https://example.com/ted-radio-hour.jpg' },
        {
          name: 'Stuff You Should Know',
          host: 'iHeartRadio',
          cover: 'https://example.com/stuff-you-should-know.jpg',
        },
        {
          name: 'This American Life',
          host: 'Ira Glass',
          cover: 'https://example.com/this-american-life.jpg',
        },
      ],
      icon: <Mic size={28} />,
    },
    {
      id: 4,
      title: 'Live Radio',
      items: [
        { name: 'BBC Radio 1', genre: 'Pop', cover: 'https://example.com/bbc-radio-1.jpg' },
        { name: 'KEXP', genre: 'Alternative', cover: 'https://example.com/kexp.jpg' },
        { name: 'Jazz24', genre: 'Jazz', cover: 'https://example.com/jazz24.jpg' },
        { name: 'Classical KUSC', genre: 'Classical', cover: 'https://example.com/kusc.jpg' },
        { name: 'Hot 97', genre: 'Hip Hop', cover: 'https://example.com/hot-97.jpg' },
      ],
      icon: <Radio size={28} />,
    },
  ]);

  const scrollContainerRefs = useRef([]);

  useEffect(() => {
    const interval = setInterval(() => {
      setActiveSection((prev) => (prev + 1) % featuredContent.length);
    }, 10000);
    return () => clearInterval(interval);
  }, [featuredContent.length]);

  const scroll = (index, direction) => {
    const container = scrollContainerRefs.current[index];
    const scrollAmount = container.clientWidth * 0.8;
    container.scrollBy({ left: direction * scrollAmount, behavior: 'smooth' });
  };

  return (
    <div className='min-h-screen bg-gradient-to-b from-white/90 to-white/70 dark:from-black/40 dark:to-black/30 backdrop-blur-lg text-gray-900 dark:text-white transition-colors duration-300'>
      <motion.div
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ duration: 0.8 }}
        className='container mx-auto px-6 py-12 max-w-7xl'
      >
        {featuredContent.map((section, sectionIndex) => (
          <motion.div
            key={section.id}
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.2 * section.id, duration: 0.5 }}
            className='mb-20'
          >
            <h2 className='text-3xl font-bold mb-8 flex items-center text-gray-800 dark:text-gray-100'>
              <span className='mr-4 p-2 bg-blue-100 dark:bg-blue-900 rounded-full'>
                {section.icon}
              </span>
              <span>{section.title}</span>
            </h2>
            <div className='relative group'>
              <div
                ref={(el) => (scrollContainerRefs.current[sectionIndex] = el)}
                className='flex space-x-6 overflow-x-auto pb-8 scrollbar-hide snap-x snap-mandatory'
              >
                {section.items.map((item, index) => (
                  <motion.div
                    key={index}
                    whileHover={{ scale: 1.03 }}
                    className='flex-shrink-0 w-72 bg-white dark:bg-gray-800 rounded-xl shadow-lg overflow-hidden snap-start transition-shadow duration-300 hover:shadow-xl'
                  >
                    <img src={item.cover} alt={item.name} className='w-full h-72 object-cover' />
                    <div className='p-5'>
                      <p className='text-xl font-semibold truncate text-gray-800 dark:text-gray-100'>
                        {item.name}
                      </p>
                      <p className='text-sm text-gray-600 dark:text-gray-400 mt-2 truncate'>
                        {item.artist || item.host || item.genre}
                      </p>
                    </div>
                  </motion.div>
                ))}
              </div>
              <button
                onClick={() => scroll(sectionIndex, -1)}
                className='absolute left-0 top-1/2 -translate-y-1/2 -translate-x-4 p-3 bg-white dark:bg-gray-800 rounded-full shadow-md hover:bg-gray-100 dark:hover:bg-gray-700 transition-all duration-300 focus:outline-none focus:ring-2 focus:ring-blue-500 opacity-0 group-hover:opacity-100 group-hover:-translate-x-6'
              >
                <ChevronLeft size={24} className='text-gray-800 dark:text-gray-200' />
              </button>
              <button
                onClick={() => scroll(sectionIndex, 1)}
                className='absolute right-0 top-1/2 -translate-y-1/2 translate-x-4 p-3 bg-white dark:bg-gray-800 rounded-full shadow-md hover:bg-gray-100 dark:hover:bg-gray-700 transition-all duration-300 focus:outline-none focus:ring-2 focus:ring-blue-500 opacity-0 group-hover:opacity-100 group-hover:translate-x-6'
              >
                <ChevronRight size={24} className='text-gray-800 dark:text-gray-200' />
              </button>
            </div>
          </motion.div>
        ))}
      </motion.div>
    </div>
  );
};

export default Home;
