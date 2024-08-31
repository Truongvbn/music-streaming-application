import React from 'react';

const Footer = () => {
  return (
    <footer className='bg-gray-900 text-white py-8'>
      <div className='container mx-auto px-4'>
        <div className='grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8'>
          <div>
            <h3 className='text-lg font-semibold mb-4'>Về chúng tôi</h3>
            <ul className='space-y-2'>
              <li>
                <a href='/about' className='hover:text-gray-300 transition duration-300'>
                  Giới thiệu
                </a>
              </li>
              <li>
                <a href='/careers' className='hover:text-gray-300 transition duration-300'>
                  Tuyển dụng
                </a>
              </li>
              <li>
                <a href='/press' className='hover:text-gray-300 transition duration-300'>
                  Báo chí
                </a>
              </li>
            </ul>
          </div>
          <div>
            <h3 className='text-lg font-semibold mb-4'>Hỗ trợ</h3>
            <ul className='space-y-2'>
              <li>
                <a href='/help' className='hover:text-gray-300 transition duration-300'>
                  Trung tâm trợ giúp
                </a>
              </li>
              <li>
                <a href='/contact' className='hover:text-gray-300 transition duration-300'>
                  Liên hệ
                </a>
              </li>
              <li>
                <a href='/faq' className='hover:text-gray-300 transition duration-300'>
                  Câu hỏi thường gặp
                </a>
              </li>
            </ul>
          </div>
          <div>
            <h3 className='text-lg font-semibold mb-4'>Pháp lý</h3>
            <ul className='space-y-2'>
              <li>
                <a href='/terms' className='hover:text-gray-300 transition duration-300'>
                  Điều khoản sử dụng
                </a>
              </li>
              <li>
                <a href='/privacy' className='hover:text-gray-300 transition duration-300'>
                  Chính sách bảo mật
                </a>
              </li>
              <li>
                <a href='/cookies' className='hover:text-gray-300 transition duration-300'>
                  Chính sách cookie
                </a>
              </li>
            </ul>
          </div>
          <div>
            <h3 className='text-lg font-semibold mb-4'>Kết nối</h3>
            <ul className='space-y-2'>
              <li>
                <a
                  href='https://facebook.com'
                  className='hover:text-gray-300 transition duration-300'
                >
                  Facebook
                </a>
              </li>
              <li>
                <a
                  href='https://twitter.com'
                  className='hover:text-gray-300 transition duration-300'
                >
                  Twitter
                </a>
              </li>
              <li>
                <a
                  href='https://instagram.com'
                  className='hover:text-gray-300 transition duration-300'
                >
                  Instagram
                </a>
              </li>
            </ul>
          </div>
        </div>
        <div className='mt-8 pt-8 border-t border-gray-700 text-center'>
          <p className='text-sm text-gray-400'>
            © 2023 Music Streaming Application. Tất cả các quyền được bảo lưu.
          </p>
        </div>
      </div>
    </footer>
  );
};

export default Footer;
