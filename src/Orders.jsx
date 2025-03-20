import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';
import './Orders.css';

const Orders = () => {
    const navigate = useNavigate();
    const [orders, setOrders] = useState(null);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    const authToken = sessionStorage.getItem('authToken');
    const username = sessionStorage.getItem('user');

    useEffect(() => {
        if (!username) {
            navigate("/login");
        } else {
            const fetchOrders = async () => {
                try {
                    const response = await axios.post(
                        `${import.meta.env.VITE_API_URL}/orders/retrieve_items`,
                        { username },
                        {
                            headers: {
                                Authorization: `Bearer ${authToken}`,
                            },
                        }
                    );
                    setOrders(response.data);
                } catch (err) {
                    setError("Failed to load orders. Please try again later.");
                    navigate("/login");
                } finally {
                    setLoading(false);
                }
            };
            fetchOrders();
        }
    }, [navigate, authToken, username]);

    if (loading) {
        return <p className="loading-message">Loading your orders...</p>;
    }

    if (error) {
        return <p className="error-message">{error}</p>;
    }

    return (
        <div className="orders-container">
            <div className="Order-heading">
                <h1 className="orders-title">Your Orders</h1>
            </div>
            {orders && orders.length > 0 ? (
                <div className="orders-list">
                    {orders.map((order, index) => (
                        <div className="order-card" key={index}>
                            <div className="order-image-container">
                                <img
                                    src="https://via.placeholder.com/150"
                                    alt={order.product_name}
                                    className="order-image"
                                />
                            </div>
                            <div className="order-details">
                                <h2 className="order-name">{order.product_name}</h2>
                                <p><strong>Order ID:</strong> {order.order_item_ids}</p>
                                <p><strong>Quantity:</strong> {order.order_item_quantity}</p>
                            </div>
                        </div>
                    ))}
                </div>
            ) : (
                <p className="no-orders-message">No orders found.</p>
            )}
        </div>
    );
};

export default Orders;