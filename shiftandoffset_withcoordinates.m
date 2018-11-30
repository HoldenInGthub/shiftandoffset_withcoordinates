function [output_coordinates, output]=shiftandoffset_withcoordinates(input_coordinates,input,LorH,amount)
if amount<0
    msg_minus='amount can not be negative!!';
    error(msg_minus);
elseif amount==0
    output_coordinates=input_coordinates;
    output=input;
else
    time_interval=input_coordinates(2)-input_coordinates(1);
    offset_amount=amount/time_interval;
    offset_matrix=zeros(1,round(offset_amount));
    if LorH=='L'
        input_coordinates_HSB=input_coordinates(length(input_coordinates));
        offset_coordinates_matrix=[input_coordinates_HSB-amount+time_interval:time_interval:input_coordinates_HSB input_coordinates_HSB];
        output_coordinates=[input_coordinates-amount offset_coordinates_matrix];
        output=[input offset_matrix];
    elseif LorH=='H'
        input_coordinates_LSB=input_coordinates(1);
        offset_coordinates_matrix=[input_coordinates_LSB:time_interval:input_coordinates_LSB+amount-time_interval input_coordinates_LSB+amount-time_interval];
        output_coordinates=[offset_coordinates_matrix input_coordinates+amount];
        output=[offset_matrix input];
    else
        msg='Using the function shift_withcoordinates worong,check the input!!!';
        error(msg);
    end
end
