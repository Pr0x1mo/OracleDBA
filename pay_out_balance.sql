CREATE TABLE prox.accounts (
    id NUMBER PRIMARY KEY,
    balance NUMBER
);

BEGIN
  FOR i IN 1..400 LOOP
    INSERT INTO Prox.accounts (id, balance)
    VALUES (i, DBMS_RANDOM.VALUE(1000, 5000)); -- Sets minimum balance to 1000 and maximum to 5000
  END LOOP;
  COMMIT;
END;
/

CREATE OR REPLACE FUNCTION prox.account_balance(account_id_in IN Prox.accounts.id%TYPE)
RETURN NUMBER IS
  l_balance prox.accounts.balance%TYPE;
BEGIN
    SELECT balance INTO l_balance
    FROM prox.accounts
    WHERE id = account_id_in;
    RETURN l_balance;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 0; -- Return zero if no account is found
END account_balance;
/

CREATE OR REPLACE PROCEDURE prox.apply_balance(
    account_id_in IN prox.accounts.id%TYPE,
    balance_in IN prox.accounts.balance%TYPE)
IS
BEGIN
  UPDATE prox.accounts
  SET balance = 0 -- This sets the balance to zero, assuming payout takes all the balance
  WHERE id = account_id_in;

  -- Add a line to output the balance after setting it to zero
  DBMS_OUTPUT.put_line('Balance for account ID ' || account_id_in || ' set to 0' );

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.put_line('No account found for ID: ' || TO_CHAR(account_id_in));
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line('Error applying balance: ' || SQLERRM);
    -- Comment out the ROLLBACK if you do not want to actually apply changes
    --ROLLBACK;
END apply_balance;
/




CREATE OR REPLACE PROCEDURE prox.pay_out_balance (
      account_id_in IN prox.accounts.id%TYPE)  -- Declare the procedure, which takes an account ID as input.
      IS
      l_balance_remaining NUMBER;  -- Variable to store the current balance of the account.

BEGIN       
      LOOP  -- Start a loop that will continue until a break condition is met (using EXIT).
         l_balance_remaining := prox.account_balance (account_id_in);  -- Call the 'account_balance' function to get the current balance of the account and store it in 'l_balance_remaining'.
   
         IF l_balance_remaining < 1000  -- Check if the balance is less than 1000.
        THEN
           EXIT;  -- If the balance is less than 1000, exit the loop. This stops further execution of the loop.
        ELSE
           prox.apply_balance (account_id_in, l_balance_remaining);  -- If the balance is 1000 or more, call 'apply_balance' to process or zero out the balance.
        END IF;
     END LOOP;  -- End of the loop block.
  END pay_out_balance;  -- End of the procedure definition.
/

BEGIN
  pay_out_balance(201); -- for individual ID
END;
/

DECLARE
  CURSOR account_ids IS
    SELECT id FROM prox.accounts;
BEGIN
  FOR account_rec IN account_ids LOOP
    prox.pay_out_balance(account_rec.id); -- Pass each account ID to the procedure
  END LOOP;
  --COMMIT; -- Commit after all accounts have been processed (if required based on your logic)
END;
/

select * from prox.accounts;
rollback;

 
