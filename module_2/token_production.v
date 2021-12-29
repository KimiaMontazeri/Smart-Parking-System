/*--  *******************************************************
--  Computer Architecture Course, Laboratory Sources 
--  Amirkabir University of Technology (Tehran Polytechnic)
--  Department of Computer Engineering (CE-AUT)
--  https://ce[dot]aut[dot]ac[dot]ir
--  *******************************************************
--  All Rights reserved (C) 2021-2022
--  *******************************************************
--  Student ID  : 9931078
--  Student Name: Kimia Montazeri
--  Student Mail: kimia.mtz@gmail.com 
--  *******************************************************
--  Additional Comments: This module is for encrypting the park number using a certain pattern.
--  We have used XOR operation for this purpose; and the reason behind it is that if you don't know 
--  the XOR-encryption key before decrypting the encrypted data, it is impossible to decrypt that data.
--*/

/*-----------------------------------------------------------
---  Module Name: token_production 
-----------------------------------------------------------*/
`timescale 1 ns/1 ns
module token_production(park_number, pattern, token);

    input  [2:0] park_number;
    input  [2:0] pattern; // constant number: 010
    output [2:0] token;

    assign token[0] = park_number[0] ^ pattern[0];
    assign token[1] = park_number[1] ^ pattern[1];
    assign token[2] = park_number[2] ^ pattern[2];

endmodule