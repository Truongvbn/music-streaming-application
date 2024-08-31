import { createBrowserRouter } from 'react-router-dom';
import RootLayout from '../layout/Rootlayout';
import Home from '../pages/Home/Home';
import Login from '../pages/auth/Login';
import SignUp from '../pages/auth/SignUp';

export const router = createBrowserRouter([
  {
    path: '/',
    element: <RootLayout />,
    children: [
      { index: true, element: <Home /> },
      { path: 'login', element: <Login /> },
      { path: 'signup', element: <SignUp /> },
    ],
  },
]);
