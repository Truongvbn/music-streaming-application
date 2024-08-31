import { createBrowserRouter } from 'react-router-dom';
import RootLayout from '../layout/Rootlayout';
import Home from '../pages/Home/Home';
import Login from '../pages/auth/Login';

export const router = createBrowserRouter([
  {
    path: '/',
    element: <RootLayout />,
    children: [
      { index: true, element: <Home /> },
      { path: 'login', element: <Login /> },
    ],
  },
]);
