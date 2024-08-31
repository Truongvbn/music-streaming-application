import { Suspense } from 'react';
import { Outlet } from 'react-router-dom';
import Header from '../components/layout/Header';
import Footer from '../components/layout/Footer';
import Loader from '../components/common/Loader';

function RootLayout() {
  return (
    <div className='min-h-screen flex flex-col bg-gray-900 text-white'>
      <Header />
      <main className='flex-grow w-full'>
        <Suspense fallback={<Loader />}>
          <Outlet />
        </Suspense>
      </main>
      <Footer />
    </div>
  );
}

export default RootLayout;
