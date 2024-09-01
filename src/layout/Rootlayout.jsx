import { Suspense } from 'react';
import { Outlet } from 'react-router-dom';
import Header from '../components/layout/Header';
import Footer from '../components/layout/Footer';
import Loader from '../components/common/Loader';
import Sidebar from '../components/layout/Sidebar';

function RootLayout() {
  return (
    <div className='min-h-screen flex bg-gray-900 text-white'>
      <div className='fixed left-0 top-0 h-full'>
        <Sidebar />
      </div>
      <div className='flex flex-col flex-grow ml-64 min-h-screen'>
        <div className='fixed top-0 right-0 left-64 z-10'>
          <Header />
        </div>
        <main className='flex-grow w-full mt-16 overflow-y-auto'>
          <Suspense fallback={<Loader />}>
            <Outlet />
          </Suspense>
        </main>
        <Footer />
      </div>
    </div>
  );
}

export default RootLayout;
