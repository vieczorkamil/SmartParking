<?php
            $name = $_SESSION['Name'];
            $surname = $_SESSION['Surname'];
            $nick = $_SESSION['Nick'];
            $email = $_SESSION['Email'];
            $phone = $_SESSION['Phone'];
                echo <<<END

                    <thead> Dane użytkownika </thead>
                    <table class="account-tab" border="1" cellpadding="10" cellspacing="0">;
                            <tr>
                                <thead><th colspan='2'>Dane użytkownika</th></thead>
                            </tr>
                            <tr>
                                <td> Name: </td>
                                <td> $name $surname</td>
                            </tr>
                            <tr>
                                <td> Nickname: </td>
                                <td> $nick </td>
                            </tr>
                            <tr>
                                <td> E-mail: </td>
                                <td> $email </td>
                            </tr>
                            <tr>
                                <td> Phone number: </td>
                                <td> $phone</td>
                            </tr>

                        </table>

            END;
            ?>