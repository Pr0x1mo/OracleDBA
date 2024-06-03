DECLARE
    l_balance NUMBER;
BEGIN
    -- Fetch the order total for the given order ID
    SELECT ORDER_TOTAL
    INTO l_balance
    FROM OE.ORDERS
    WHERE ORDER_ID = 2458;

    -- Output the fetched balance
    DBMS_OUTPUT.PUT_LINE('The balance for ORDER_ID 2458 is: ' || l_balance);
END;
/

CREATE OR REPLACE PROCEDURE pay_out_balance (
    order_id_in IN OE.ORDERS.order_id%TYPE
)
IS
    l_balance_remaining NUMBER;
    l_loop_counter NUMBER := 0;  -- Safeguard counter to prevent infinite loops

    -- Function to get the account balance
    FUNCTION account_balance (order_id IN OE.ORDERS.order_id%TYPE) RETURN NUMBER IS
        l_balance NUMBER;
    BEGIN
        -- Fetch the order total for the given order ID
        SELECT ORDER_TOTAL
        INTO l_balance
        FROM OE.ORDERS
        WHERE ORDER_ID = order_id AND ROWNUM = 1; --this should not be necessary since its only one row of data for that order_id as shown above

        RETURN l_balance;
	
    END account_balance;
	--DBMS_OUTPUT.PUT_LINE('The balance for ORDER_ID 2458 is: ' || l_balance);
    -- Procedure to print the balance application instead of updating
    PROCEDURE apply_balance (order_id IN OE.ORDERS.order_id%TYPE, balance IN NUMBER) IS
    BEGIN
        -- Print the calculation result instead of updating the database
        DBMS_OUTPUT.PUT_LINE('ORDER_TOTAL = ORDER_TOTAL - ' || balance);
    END apply_balance;

BEGIN
    -- Initialize the balance_remaining with the current order balance
    l_balance_remaining := account_balance(order_id_in);

    LOOP
        -- Increment the loop counter
        l_loop_counter := l_loop_counter + 1;

        -- Safeguard to prevent infinite loop
        IF l_loop_counter > 100 THEN
            DBMS_OUTPUT.PUT_LINE('Loop exited due to safeguard.');
            EXIT;
        END IF;

        -- Output the current balance for debugging
        DBMS_OUTPUT.PUT_LINE(l_loop_counter || ' Current balance: ' || l_balance_remaining);

        -- Check if the balance is below the threshold
        IF l_balance_remaining < 1000 THEN
            DBMS_OUTPUT.PUT_LINE('Balance below threshold, exiting loop.');
            EXIT;
        ELSE
            -- Call the procedure to print the balance application
            apply_balance(order_id_in, l_balance_remaining);

            -- Simulate balance decrease for loop exit
            l_balance_remaining := l_balance_remaining - 1000; -- Adjusting the decrement to 5000 for faster convergence
        END IF;
    END LOOP;
END pay_out_balance;
/

-- Call the procedure with a specific order_id
BEGIN
    pay_out_balance(2458);  
END;
/
