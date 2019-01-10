#ifndef PublicBoard_H
#define PublicBoard_H


/**
* @brief The board that is instansiated on the server.
*
* The board that is instansiated on the server, with all the information that is freely available to all the players.
* Any client can request any information available to the public board, including the boardstate.
*/
class PublicBoard{
	public:
        //list<Player> Players; /**< A sorted by turn list of all the players within the game */
        //Player PlayerTurn; /**< The player who's turn it currently is. */
		int Round; /**< The round number, this variable is modded with the amount of players to determine the index of the current player. */
		time_t RoundTime; /**< The time that the current round has taken, minus pause time. */
	public:
		/**
		* @brief The board that is instansiated on the server.
		*
		* The board that is instansiated on the server, with all the information that is freely available to all the players.
		* Any client can request any information available to the public board, including the boardstate.
		*/
		PublicBoard();
		/** \brief Select the next player.
		*
		* 	Increase Round number and give the next player his turn. Set the next player in the PlayerTurn variable and also return it.
		*	This allows multiple ways of interfacing or using this method.
		* 	@return the player who's turn it will be now.
		*/
        //Player NextPlayer();
		/** \brief Pause the game
		*
		* 	When pause player turn length does not increase, however the GameTime will continue to increase. And the stateTime within the Game class.
		*/
		void Pause();
		/** \brief Play the game after pausing.
		*
		* 	When the game was paused, it has to be played before starting/continueing again.
		*/
		void Play();
		/** \brief update the Board according to changes in the turn.
		*
		* 	This method is used to request gui updates, and confirm/validate all changes within the turn.
		*	It also broadcasts messages that were queued untill end of turn.
		*/
		void Update();

		~PublicBoard();
};
#endif
